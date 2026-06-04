# 1BIT → UE5 Combat Prototype — 3-Day Production Pipeline
## Complete Implementation Guide (Final)

---

## OVERVIEW

**Goal:** Replicate the 1BIT combat system in Unreal Engine 5 with a low-poly 3D character, gamepad controls only.

**What we're building:**
- One player character with full state machine (idle, walk, run, block, roll, attack, attack_strong, block_hit, hit, death)
- Hold-duration combat: press A → block, hold longer → charge attack, release → roll/attack/strong attack based on timing + stick direction
- Weapon type system (6 animsets: hands, dagger, sword, staff, katana, shotgun) with different timing thresholds
- Individual weapon stats (68 weapons from CSV) driving damage, speed multipliers, weight
- Armor + helm equipment affecting defense and movement speed
- Damage formula matching 1BIT exactly
- Block with power threshold (weak NPCs can't block strong attacks — player always can)
- Multi-hit recursive damage (subsequent targets take halved damage)
- Enemy AI using the same state machine
- Knockback, invincibility frames, hit-stop
- Weapon swapping at runtime

**What we're NOT building:**
Touch controls, level design, save/load, real UI, audio, pathfinding, rooms, dialogue, XP/leveling, shops, ranged weapons (bullets), breakables, narrative content.

---

## UNIT SCALE CONVERSION — GM PIXELS TO UE5 CENTIMETERS

This is critical. GameMaker uses pixels. UE5 uses centimeters. Every spatial value from GM needs conversion.

In the GM game, the character hitbox (`spr_character_mp_hitbox`) is roughly 10px wide, and the play area is 180×320 pixels. A UE5 character capsule is typically 42cm radius, 88cm half-height. To make the 3D combat FEEL similar, we use an approximate scale:

```
SCALE_FACTOR = 10.0 (1 GM pixel ≈ 10 UE5 centimeters)
```

This means:
| GM Value | GM pixels | UE5 cm | Used for |
|---|---|---|---|
| attack_range (hands) | 13 | 130 | Sphere trace range |
| attack_range (sword) | 18 | 180 | Sphere trace range |
| attack_range_strong (staff) | 24 | 240 | Sphere trace range |
| ai_search_range | 80 | 800 | Enemy detection radius |
| run_distance_enemy | 70 | 700 | Alert-run trigger range |
| swipe_threshold | 10 | N/A | Stick magnitude (0.3), not distance |

Movement speeds need different conversion (they're pixels/frame at 24fps → cm/s):
```
GM speed in pixels/frame × 24fps × SCALE_FACTOR = UE5 cm/s
walk: base ~1.5 px/frame × 24 × 10 = ~360 cm/s
run: base ~3.0 px/frame × 24 × 10 = ~720 cm/s
roll: 2.95 px/frame × 24 × 10 = ~708 cm/s
```

These are starting values. The CharacterMovementComponent MaxWalkSpeed controls the cap. We set it high (~1000) and control actual speed through input magnitude and state logic.

**IMPORTANT: All values with SCALE_FACTOR are configurable as UPROPERTY floats.** If the feel is wrong, you change one number in the Blueprint defaults. We are NOT hardcoding any spatial values.

---

## CRITICAL FORMULAS FROM 1BIT SOURCE CODE

These are extracted directly from the GML. Every number here is verified against the uploaded scripts.

### Timing (from scr_balancing.gml)
```
atk1_time = round(animset_atk1_time / weapon.atk_spd)
if atk1_time < 4: atk1_time = 4

atk2_time = round(animset_atk2_time / weapon.atk_spd)
if atk2_time < atk1_time + 4: atk2_time = atk1_time + 4

weapon_image_speed = animset_weapon_image_speed * weapon.atk_spd
```

All frame values at 24fps. To convert to seconds: divide by 24.

### Animset Timing Values (from scr_balancing_weapon.gml switch_animset)
| Animset  | atk1_time (frames) | atk2_time (frames) | attack_range | attack_range_strong | atk1_sp | atk1_sp_dec | atk2_sp | atk2_sp_dec |
|----------|--------------------|--------------------|--------------|---------------------|---------|-------------|---------|-------------|
| hands    | 8                  | 20                 | 13           | 15                  | 4       | 0.3         | 6       | 0.2         |
| dagger   | 10                 | 40                 | 16           | 18                  | 4       | 0.3         | 5       | 0.4         |
| sword    | 15                 | 40                 | 18           | 19                  | 5       | 0.3         | 6       | 0.4         |
| staff    | 15                 | 40                 | 20           | 24                  | 5       | 0.3         | 6       | 0.4         |
| katana   | 10                 | 60                 | 20           | 21                  | 6       | 0.5         | 8       | 0.6         |
| shotgun  | 5                  | 20                 | 5 (spread)   | 10 (spread)         | -4      | 0.4         | -6      | 0.5         |

### Damage (from scr_attack_system.gml)
```
total_damage = ((base_damage + random(0, damage_variation)) * attacker.STR)
               / (target.RES * (target.armor.defence + target.helm.defence))
```
Where base_damage = weapon.atk_dmg_light for normal attack, weapon.atk_dmg_strong for strong attack.

### Block Check (from scr_attack_system.gml)
Block succeeds if ANY of these are true:
1. target.blocking == true (manually set during block hold — ALWAYS works)
2. target is in Block state AND target.timer <= target.counter_time AND target's defensive power > attack damage AND **target is NOT the player character**

Defensive power threshold (NPCs only):
```
(target.RES * (target.armor.defence + target.helm.defence) * (target.HP / 2)) > base_damage
```
If the NPC is too weak relative to the attack, the block FAILS and they take full damage.

**The player's block always succeeds** — the power threshold check only applies to NPCs (confirmed: `enemy != obj_hero.id` in scr_attack_system.gml line 51).

### Counter Time
```
counter_time = atk1_time (from scr_init_character.gml line 168)
```
This defines the window during which a block can auto-succeed against the power threshold check. After counter_time, the NPC's block relies solely on the `blocking` flag.

### Defence Speed (from scr_balancing.gml)
```
defence_speed = 1 - ((armor.weight + helm.weight + weapon.weight) / 100)
```
This multiplier affects movement speed.

### Charisma (from scr_balancing.gml)
```
charisma = base_cha + armor.charisma + helm.charisma
```
Used in the flee calculation. Both armor and helm contribute.

### Movement (from scr_init_character.gml and scr_controls_main.gml)
```
walk_sp = 0.75
run_sp = 1.5
roll_sp = 2.95
max_sp = 5
roll_time = 8 frames (0.333s)
swipe_threshold = 10 (maps to stick magnitude ~0.3 in UE5)
run_distance_min = 69 (distance threshold for walk vs run)
run_distance = run_distance_min / (spd * defence_speed)
blocking_timer = 40 frames (1.667s)
player invincibility = 40 frames (1.667s)
NPC invincibility = 3 frames (0.125s)
```

### Movement Speed Formula (from scr_controls_main.gml scr_gamepad_move)
```
base_walk = (walk_sp + (spd * defence_speed * walk_sp_mod * 0.25)) * 2 * walk_sp_mod
base_run = (run_sp + (spd * defence_speed * walk_sp_mod * 0.25)) * 2 * walk_sp_mod
Y movement *= 0.85 (isometric correction — SKIP in 3D)
```

Stick magnitude > 0.99 = run, else = walk. Dead zone = 0.15.

### Multi-Hit Recursion (from scr_attack_system.gml)
After hitting one enemy, the system deactivates that enemy and recursively calls itself with HALVED damage and HALVED variation. This means:
- 1st enemy: full damage
- 2nd enemy: 50% damage
- 3rd enemy: 25% damage
- etc.

### Knockback (from scr_attack_system.gml)
On successful hit:
```
enemy.speed = attacker.speed * (push / push_divider)
enemy.direction = attacker.direction
```
The attacker's current lunge speed and direction transfer to the target. push_divider (default 3) reduces the force.

On blocked attack (attacker bounces back):
```
enemy.speed = attacker.speed (target absorbs the momentum)
attacker.direction = -attacker.direction (attacker reverses)
```

### Flee System (from scr_attack_system.gml)
```
hp_factor = (1 - (enemy.hp / enemy.hp_max)) * 15
str_factor = ((attacker.str / enemy.res) - 1) * 5
charisma_fear = ((attacker.charisma + abs(enemy.charisma)) * -8)
flee_chance = (hp_factor + str_factor + charisma_fear) / (abs(enemy.charisma) + 1)
if random(0, 100) < flee_chance AND enemy is not zombie: flee
```

### Combat Release Branch Logic (from scr_block_controls.gml)
This is the core decision tree on button release:
```
ON RELEASE:
  capture stick_direction and stick_magnitude
  capture dest from cursor position

  IF stick_magnitude < swipe_threshold (no directional input):
    IF timer < roll_time:
      → WALK or RUN (based on distance to destination)
      (extra: if enemy is alert/chase/fight nearby, always RUN)
    ELSE (held longer than roll_time):
      find nearest enemy within attack_range_strong * 2
      IF enemy exists:
        IF timer > atk2_time → ATTACK_STRONG aimed at enemy
        ELSE IF timer > atk1_time → ATTACK aimed at enemy
        ELSE → set blocking=true, reset timer, go IDLE (short defensive block)
        dest = enemy position (auto-aim)
      ELSE (no enemy nearby):
        set blocking=false, reset timer, go IDLE

  ELSE (stick has directional input, magnitude >= swipe_threshold):
    IF timer > atk2_time → ATTACK_STRONG in stick direction
    ELSE IF timer > atk1_time → ATTACK in stick direction
    ELSE → ROLL in stick direction
    dest = character position + stick direction (away from click)
```

### AI Combat Behavior Values (from scr_init_character.gml)
```
ai_timer_attack1 = 40 frames (1.667s) — minimum time between AI attacks
ai_timer_attack2 = 50 frames (2.083s) — maximum time between AI attacks
ai_responsiveness = 4 frames (0.167s) — reaction delay
ai_search_range = 80 — detection radius (800 cm in UE5)
```

---

## PRE-WORK (Before Day 1 — estimated 2-3 hours)

### YOUR TASKS

#### Task P1: Install Unreal Engine
If you don't have it: install Epic Games Launcher, install UE5 (5.4 or 5.5 recommended — tell me the exact version you install, e.g. "5.4.4"). This can take 1-2 hours depending on your internet.

#### Task P2: Install Visual Studio
UE5 C++ projects require Visual Studio 2022 (Community edition is free).
1. Download Visual Studio 2022 Community from https://visualstudio.microsoft.com/
2. During installation, select these workloads:
   - "Desktop development with C++"
   - "Game development with C++"
3. In the individual components tab, make sure these are checked:
   - "MSVC v143 - VS 2022 C++ x64/x86 build tools"
   - "Windows 10/11 SDK" (latest version)
   - ".NET 6.0 Runtime"
4. Install. This takes 10-30 minutes.

#### Task P3: Create the UE5 C++ Project
1. Open Unreal Engine from the Epic Games Launcher
2. Click "Games" on the left
3. Select "Third Person" template
4. **CRITICAL**: At the bottom, change the dropdown from "Blueprint" to "C++"
5. Name it something like "Bit3D" or "BitCombat"
6. Choose a location you'll remember (e.g. D:\Projects\Bit3D)
7. Click "Create"
8. UE5 will generate the project and open Visual Studio automatically
9. **Wait for the first compile to finish** — in Visual Studio, you'll see "Build succeeded" at the bottom. This can take 2-5 minutes the first time.
10. Close Visual Studio for now
11. In UE5, press Play in the viewport — you should see the default third-person mannequin. If this works, your setup is correct.

**If this step fails:** Tell me the exact error message. The most common issue is Visual Studio not being found — UE5 needs to know where it is. Go to Edit → Editor Preferences → Source Code → Source Code Editor and make sure it says "Visual Studio 2022".

#### Task P4: Tell Me Your Engine Version
Open UE5, go to Help → About Unreal Editor. Write down the exact version (e.g., "5.4.4-release"). This affects which API calls I use.

#### Task P5: Prepare Your Character
1. Generate or model your low-poly character
2. Run it through Mixamo (https://www.mixamo.com/) or Accurig for auto-rigging
3. Download from Mixamo with these animations (search for these names or similar):
   - **Idle** — any standing idle
   - **Walking** — normal walk cycle
   - **Running** — run cycle
   - **Blocking/Guard** — search "standing melee block" or "guard"
   - **Dodge/Roll** — search "dodge" or "combat roll"
   - **Attack Light** — search "melee attack" or "slash" (a quick one)
   - **Attack Strong** — search "great sword slash" or "heavy attack" (a slow powerful one)
   - **Attack Charge** — search "ready to fight" or "combat stance" (the pose while holding A)
   - **Hit Reaction** — search "hit reaction" or "getting hit"
   - **Death** — search "death" or "dying"
4. Download format: FBX, "With Skin" for the first animation, "Without Skin" for all others (so you get one mesh + multiple animation files)
5. **In UE5**, import:
   - File → Import → navigate to your FBX files
   - For the first one (with skin): just click Import, accept defaults
   - For animation-only files: in the import dialog, set "Skeleton" to the skeleton from your first import
   - All animations should appear in your Content Browser

#### Task P6: Create Animation Montages
For each imported animation:
1. Right-click the animation asset → Create → Create AnimMontage
2. Double-click the montage to open it
3. In the montage editor, look at the bottom panel for "Blend In" time
4. Set Blend In = 0.0 (for snappy 1BIT feel — you can increase this to 0.1-0.2 later for smooth transitions)
5. For Blend Out: look in the montage's "BlendOut" section (usually in the asset details, not a parameter of PlayAnimMontage). Set Blend Out Time = 0.0
6. Save

Do this for: Idle, Walk, Run, Block, Roll, AttackLight, AttackStrong, AttackCharge, HitReaction, Death.

That's 10 montages. If you only have one "charge" animation, that's fine — the same montage can be used for both AttackCharge and AttackChargeStrong slots.

#### Task P7: Create a Minimal Animation Blueprint (REQUIRED)
**This step is essential.** PlayAnimMontage requires an AnimInstance, which requires an Animation Blueprint. Without this, montages will silently fail to play — no errors, just nothing happens.

1. In Content Browser, right-click → Animation → Animation Blueprint
2. In the dialog: select your character's Skeleton as the target skeleton
3. Name it "ABP_BitCharacter"
4. Double-click to open it
5. In the AnimGraph (the big graph area), right-click → Add Node → search "Slot"
6. Select "Slot 'DefaultGroup.DefaultSlot'" — this creates a Slot node
7. Connect the Slot node's output to the "Output Pose" node's input
8. For the Slot node's input: right-click → search "Play" → add a "Play" node or just leave it unconnected (the slot will play montages over nothing, which is fine since we drive ALL animation through montages)
9. Compile (button at top left) → Save
10. This AnimBP will be assigned to your character Blueprint later (in the Mesh component's "Anim Class" field)

**Why this is needed:** UE5's montage system plays animations through "slots" managed by the AnimInstance. The AnimBP provides the AnimInstance. Without it, there is no slot to play into. This minimal setup has ONE slot node that does nothing except receive montage playback. All animation logic remains in C++ — the AnimBP is just a required bridge.

**T-pose note:** With this minimal setup, if no montage is playing the character will show a T-pose. This is fine because our C++ always keeps a montage active (the Idle montage plays whenever the character enters Idle state). If you briefly see a T-pose during transitions, that's a sign a montage isn't assigned — check the Output Log for my warning messages.

**Idle montage must loop:** In the Idle montage, open it and in the montage timeline at the bottom, right-click the section → make sure "Loop" is enabled (or check the Montage's details panel for a "Loop" option). Walk/Run montages should also loop. Attack, Roll, Hit, and Death montages should NOT loop.

#### Task P8: Create Input Action Assets
Instead of creating these in C++ (which is version-dependent and fragile), we create them in the editor where you can see and modify them.

1. In Content Browser, right-click → Input → Input Action
2. Create three Input Actions:
   - **IA_Move**: Double-click to open. Set Value Type = "Axis2D (Vector2D)". Save.
   - **IA_Combat**: Double-click to open. Set Value Type = "Digital (bool)". Save.
   - **IA_SwapWeapon**: Double-click to open. Set Value Type = "Axis1D (float)". Save.

3. In Content Browser, right-click → Input → Input Mapping Context
4. Name it "IMC_Default"
5. Double-click to open, add these mappings:
   - Click "+" next to Mappings to add a row → set Input Action = IA_Move
     - Click "+" next to this mapping to add a key → set to "Gamepad Left Thumbstick 2D-Axis"
     - For WASD, add 4 separate key entries (click "+" four more times):
       - **W key**: add modifier "Swizzle Input Axis Values" (set to YXZ) — this maps the 1D key press to the Y axis (forward)
       - **S key**: add modifier "Swizzle Input Axis Values" (YXZ) AND modifier "Negate" — negative Y (backward)
       - **D key**: no modifier needed — positive X is the default (right)
       - **A key**: add modifier "Negate" — negative X (left)
     - **If this doesn't work or the UI looks different in your version:** Tell me your engine version and I'll give you the exact steps. The WASD-to-2D-axis mapping varies between UE 5.1/5.2/5.3/5.4/5.5. This is the most version-dependent part of the whole setup.
   - Click "+" to add another mapping → set Input Action = IA_Combat
     - Add key: "Gamepad Face Button Bottom" (this is A on Xbox, Cross on PlayStation)
     - Add key: "Space Bar"
     - Add key: "Left Mouse Button"
   - Click "+" to add another mapping → set Input Action = IA_SwapWeapon
     - Add key: "Gamepad Left Shoulder" → add a Negate modifier (value becomes -1)
     - Add key: "Gamepad Right Shoulder" (value stays +1)
6. Save

**Why editor assets instead of C++ code:** Creating InputActions in code (via NewObject) is fragile across engine versions and impossible to debug visually. Editor assets let you see and rebind keys anytime without recompiling. This is the safe choice.

#### Task P9: Create a Test Level
1. File → New Level → Empty Level
2. Add a floor: click the + button in the viewport → Basic → Plane, scale it up (50x50x1 in the details panel)
3. Apply a material so it's not invisible (right-click the plane → select a default material, or create a simple one)
4. Add a few cubes for walls (+ → Basic → Cube, place a few around)
5. Add a directional light (+ → Lights → Directional Light)
6. Add a Sky Light for ambient illumination
7. Add a Player Start (+ → Basic → Player Start)
8. Save the level as "TestArena"
9. In Edit → Project Settings → Maps & Modes → Default Maps, set both Editor Startup Map and Game Default Map to "TestArena"

---

## DAY 1 — CHARACTER + INPUT + STATE MACHINE

### FIRST: Add EnhancedInput Module to Build.cs (REQUIRED)

Before adding any C++ files, you need to tell the project to include the Enhanced Input module. Without this, the build WILL fail with "unresolved external symbol" or "cannot open include file" errors.

1. In Windows Explorer, navigate to `[ProjectPath]/Source/[YourProjectName]/`
2. Open the file `[YourProjectName].Build.cs` in any text editor (Notepad works)
3. Find the line that looks like:
   ```
   PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore" });
   ```
4. Add `"EnhancedInput"` to the array. It should look like:
   ```
   PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore", "EnhancedInput" });
   ```
   If there are already other modules listed (like `"HeadMountedDisplay"`), just add `"EnhancedInput"` to the end of the same array.
5. Save the file.

**If the Third Person template already has it:** Check first. Open the file and search for "EnhancedInput". If it's already there, skip this step.

### C++ FILE DELIVERY OVERVIEW

I will write 3 C++ files (3 header + 3 source = 6 files total). You drop them into your project's `Source/[YourProjectName]/` folder.

After adding the files:
1. Close UE5 entirely
2. Right-click your `.uproject` file in Windows Explorer → "Generate Visual Studio project files"
3. Open the `.sln` file in Visual Studio
4. Press Ctrl+Shift+B to build
5. If it builds successfully, open UE5 again
6. If UE5 asks to recompile, click Yes

If it fails to build, copy the EXACT error messages from the Output panel in Visual Studio (View → Output → set dropdown to "Build") and paste them to me. Include ALL red text.

### FILE 1: BitCombatTypes.h

**What it contains:** All enums, all data structures, all DataTable row definitions. This is the foundation everything else references.

**Claude Prompt to generate this file:**
```
I need you to write a UE5 C++ header file called BitCombatTypes.h for
Unreal Engine [YOUR VERSION].

This file should contain ALL of the following with UPROPERTY and
USTRUCT/UENUM macros so they work in Blueprints and DataTables:

ENUMS:
- EBitState: Spawn, Idle, Walk, Run, Block, Roll, Attack, AttackStrong,
  BlockHit, Hit, CollideHit, Sit, SitIdle, Death
  (matches GameMaker enum: states)
- EBitFaction: Ally, Enemy, Neutral, Zombie, Everyone
- EBitWeaponAnimset: Hands, Dagger, Sword, Staff, Katana, Shotgun, None
- EBitAIState: Idle, Wander, Follow, Guard, Patrol, Alert, Aware,
  Chase, Search, Fight, Flee, Null
- EBitArmorMaterial: Flesh, Cloth, Leather, Cape, Ceramic, Chainmail,
  MetalThin, MetalThick, Wood, None

STRUCTS (all must be FTableRowBase for DataTables):

FBitAnimsetData — one row per weapon type:
  - EBitWeaponAnimset AnimsetType
  - float Atk1TimeFrames (animset_atk1_time, in frames at 24fps)
  - float Atk2TimeFrames (animset_atk2_time, in frames at 24fps)
  - float AttackRange (in GM pixels — will be multiplied by
    ScaleFactor at runtime to get UE5 cm)
  - float AttackRangeStrong
  - float Atk1Speed (animset_atk1_sp — lunge speed during light attack)
  - float Atk1SpeedDecrease (animset_atk1_sp_decrease — deceleration)
  - float Atk2Speed (animset_atk2_sp — lunge speed during strong attack)
  - float Atk2SpeedDecrease (animset_atk2_sp_decrease — deceleration)
  - float AnimsetWeaponImageSpeed (animset_weapon_image_speed, default 1)
  Include helper functions:
    float GetAtk1TimeSeconds() returns Atk1TimeFrames / 24.0f
    float GetAtk2TimeSeconds() returns Atk2TimeFrames / 24.0f

FBitWeaponData — one row per individual weapon (68 weapons from CSV):
  - int32 Index
  - FString Name
  - EBitWeaponAnimset AnimsetType
  - float Price
  - float Weight
  - float AtkDmgLight (atk_dmg_light)
  - float AtkDmgStrong (atk_dmg_strong)
  - float AtkDmgVariation (atk_dmg_variation)
  - float AtkSpd (atk_spd — speed multiplier. DIVIDES timing
    thresholds: higher = faster. E.g. 2.0 halves block/attack times)
  - int32 Bullets
  - FString Description

FBitArmorData — one row per armor:
  - int32 Index
  - FString Name
  - float Price
  - float Weight
  - float Defence
  - float Charisma
  - EBitArmorMaterial Material
  - FString Description

FBitHelmData — one row per helm:
  - int32 Index
  - FString Name
  - float Price
  - float Weight
  - float Defence
  - float Charisma
  - FString Description

FBitCharacterStats — NOT a table row, just a USTRUCT for runtime:
  - float HP, MaxHP, STR, RES, SPD
  - float BaseCha (base charisma before equipment)
  - float Charisma (calculated: BaseCha + armor.charisma + helm.charisma)
  - float StrMod, ResMod, SpdMod (all default 1.0)
  - int32 Level

Include default constructors for all structs with sensible defaults
matching the 1BIT game values (HP=3, STR=1, RES=1, SPD=1, BaseCha=1).

Do NOT include any implementation — header only.
Mark everything BlueprintType and BlueprintReadWrite.
Use #pragma once at the top.
Include "Engine/DataTable.h" and "CoreMinimal.h".
The generated .generated.h include must match the filename.
```

### FILE 2: BitCharacterBase.h / BitCharacterBase.cpp

**What it contains:** The core character class that BOTH player and enemy inherit. State machine, equipment, stats, combat timing, animation montage playback, knockback, death.

**Claude Prompt to generate this file:**
```
I need you to write a UE5 C++ class called ABitCharacterBase for
Unreal Engine [YOUR VERSION].

This class inherits from ACharacter.
It #includes "BitCombatTypes.h".

This is the BASE CLASS for both player and enemy. It contains the
complete state machine and combat system. The player subclass adds
input. The enemy subclass adds AI.

IMPORTANT DESIGN DECISIONS:
- Animation is driven by PlayAnimMontage() calls from C++.
  The character MUST have a minimal Animation Blueprint assigned
  (with a single DefaultSlot node) for montages to work. We do NOT
  put any logic in the AnimBP — all animation decisions are in C++.
- Movement uses CharacterMovementComponent for walking/running
  (via AddMovementInput). Rolls and attack lunges use
  LaunchCharacter() for impulse-based movement that bypasses
  the acceleration model.
- Facing direction in 3D: the character rotates to face the
  movement direction or attack target using SetActorRotation().
  Set bUseControllerRotationYaw = false and set
  CharacterMovementComponent->bOrientRotationToMovement = false
  in the constructor — we handle rotation manually.
- All spatial values from the original game (attack range, search
  range, etc.) are stored in GM pixel units and multiplied by
  ScaleFactor (default 10.0, UPROPERTY) at runtime to get UE5 cm.

HEADER (.h) PROPERTIES — all UPROPERTY EditAnywhere/BlueprintReadWrite
unless noted:

Scale:
- float ScaleFactor (default 10.0 — 1 GM pixel = 10 UE5 cm.
  Configurable to tune spatial feel)

State Machine:
- EBitState CurrentState (default Idle)
- EBitState PreviousState
- float StateTimer (accumulates DeltaTime, reset on state change)
- bool bBlocking (true when in block state and timer < Atk1Time)
- bool bInvincible (set true after taking hit, cleared by timer)
- float InvincibilityDuration (default 1.667 for player, 0.125 for NPC)
- float InvincibilityTimer (counts down from InvincibilityDuration)
- float BlockingDuration (1.667s, from blocking_timer = 40 frames)
- float RollTimeThreshold (0.333s, from roll_time = 8 frames)
- float SwipeThreshold (0.3 — stick magnitude threshold)
- float CounterTime (in seconds — copied from Atk1Time on equip,
  defines window for auto-block success. From scr_init_character
  line 168: counter_time = atk1_time)
- bool bIsPlayerCharacter (default false — set true in player subclass.
  Player's block always succeeds regardless of power threshold)

Facing:
- FVector FacingDirection (world-space direction the character faces)
- FRotator TargetRotation (smooth rotation target)
- float RotationSpeed (how fast the character turns, default 720 deg/s)

Roll/Lunge:
- FVector RollDirection (captured on entering Roll state)
- float CurrentRollSpeed (decreases over time by RollSpeedDecrease)
- FVector AttackLungeDirection (direction of lunge during attack)
- float CurrentLungeSpeed (decreases during attack)

Equipment (UPROPERTY with category "Equipment"):
- FBitWeaponData CurrentWeapon
- FBitArmorData CurrentArmor
- FBitHelmData CurrentHelm
- FBitAnimsetData CurrentAnimsetData

Calculated values (recalculated when equipment changes):
- float Atk1Time (in seconds — round(animset_atk1_time / weapon.atk_spd) / 24.0)
- float Atk2Time (in seconds)
- float DefenceSpeed (1 - total_weight/100)
- float WeaponImageSpeed (animset_weapon_image_speed * weapon.atk_spd)
- float AttackRange (animset value — multiplied by ScaleFactor when used)
- float AttackRangeStrong (same)
- float Atk1LungeSpeed, Atk1LungeDecrease (animset values × ScaleFactor)
- float Atk2LungeSpeed, Atk2LungeDecrease (same)
- float AtkPushSpeedDivider (default 3.0, from atk_push_speed_divider)

Stats:
- FBitCharacterStats Stats
- EBitFaction Faction (default Neutral)
- float HpRechargeRate (0.0025 per second, from hp_recharge_default)

Movement speeds (in UE5 cm/s after scaling):
- float BaseWalkSpeed (default 360 cm/s)
- float BaseRunSpeed (default 720 cm/s)
- float RollSpeed (default 708 cm/s)
- float MaxSpeed (default 1200 cm/s)
- float RollSpeedDecrease (rate of deceleration during roll)
- float WalkSpMod (default 1.0)
- float RunDistanceMin (default 690 cm — 69 GM pixels × ScaleFactor)

Animation Montages (UPROPERTY EditAnywhere, category "Animation"):
- UAnimMontage* IdleMontage
- UAnimMontage* WalkMontage
- UAnimMontage* RunMontage
- UAnimMontage* BlockMontage
- UAnimMontage* AttackChargeMontage (visual during hold, timer crosses atk1_time)
- UAnimMontage* AttackChargeStrongMontage (visual during hold, timer crosses atk2_time)
- UAnimMontage* RollMontage
- UAnimMontage* AttackMontage
- UAnimMontage* AttackStrongMontage
- UAnimMontage* BlockHitMontage
- UAnimMontage* HitMontage
- UAnimMontage* DeathMontage
- float MontageBlendInTime (default 0.0 — passed to PlayAnimMontage's
  InBlendInTime parameter. Increase to 0.1-0.2 later for smooth transitions)

DataTable references:
- UDataTable* AnimsetDataTable (to look up animset data by weapon type)
- UDataTable* WeaponDataTable (optional, for weapon swapping)

Multi-hit tracking:
- TArray<AActor*> MeleeHitBuffer (tracks hit actors during one attack)
- bool bAttackHitTriggered (prevents double-triggering per attack)

HEADER (.h) FUNCTIONS:

State Machine:
- virtual void BeginPlay() override — set bUseControllerRotationYaw=false,
  configure CharacterMovementComponent (MaxWalkSpeed, bOrientRotation=false)
- virtual void Tick(float DeltaTime) override — runs state machine,
  handles invincibility countdown, HP regen
- void ChangeState(EBitState NewState) — calls OnExitState, sets
  PreviousState, sets CurrentState, resets StateTimer to 0,
  calls OnEnterState. Add UE_LOG for every state change (debug).
- void TickState(float DeltaTime) — switch on CurrentState,
  calls per-state tick functions
- virtual void TickIdle(float DeltaTime)
- virtual void TickWalk(float DeltaTime)
- virtual void TickRun(float DeltaTime)
- virtual void TickBlock(float DeltaTime) — accumulate timer,
  set bBlocking = (StateTimer < Atk1Time), switch charge montage at
  atk1/atk2 thresholds, use a bool to track if we already switched
  montages so we don't re-trigger every frame
- virtual void TickRoll(float DeltaTime) — move character using
  AddMovementInput in RollDirection at CurrentRollSpeed, decelerate
  CurrentRollSpeed by RollSpeedDecrease*DeltaTime, transition to Idle
  when CurrentRollSpeed < threshold or roll montage finishes
- virtual void TickAttack(float DeltaTime) — apply lunge movement
  (AddMovementInput in AttackLungeDirection at CurrentLungeSpeed),
  decelerate. PerformAttack is triggered by AnimNotify (not by timer)
- virtual void TickAttackStrong(float DeltaTime) — same pattern
- virtual void TickBlockHit(float DeltaTime) — brief stun, decelerate,
  auto-transition to Idle when montage ends
- virtual void TickHit(float DeltaTime) — brief stun, decelerate,
  auto-transition to Idle when montage ends
- virtual void TickDeath(float DeltaTime) — do nothing (stay dead)
- void OnEnterState(EBitState State) — plays montage for state,
  sets up state-specific vars (roll direction, lunge speed, etc.)
- void OnExitState(EBitState State) — cleanup (clear MeleeHitBuffer
  when leaving attack states, clear blocking flag when leaving block)

Equipment:
- void EquipWeapon(const FBitWeaponData& Weapon)
  — sets CurrentWeapon, looks up animset from AnimsetDataTable by
    iterating rows and matching AnimsetType enum, calls RecalculateStats
- void EquipArmor(const FBitArmorData& Armor) — sets, recalculates
- void EquipHelm(const FBitHelmData& Helm) — sets, recalculates
- void RecalculateStats()
  — implements scr_balancing EXACTLY:
    DefenceSpeed = 1 - (armor.weight + helm.weight + weapon.weight) / 100
    float rawAtk1 = FMath::RoundToFloat(CurrentAnimsetData.Atk1TimeFrames / CurrentWeapon.AtkSpd);
    if (rawAtk1 < 4) rawAtk1 = 4;
    Atk1Time = rawAtk1 / 24.0f;
    float rawAtk2 = FMath::RoundToFloat(CurrentAnimsetData.Atk2TimeFrames / CurrentWeapon.AtkSpd);
    if (rawAtk2 < rawAtk1 + 4) rawAtk2 = rawAtk1 + 4;
    Atk2Time = rawAtk2 / 24.0f;
    WeaponImageSpeed = CurrentAnimsetData.AnimsetWeaponImageSpeed * CurrentWeapon.AtkSpd;
    CounterTime = Atk1Time; (matches GM: counter_time = atk1_time)
    AttackRange = CurrentAnimsetData.AttackRange;
    AttackRangeStrong = CurrentAnimsetData.AttackRangeStrong;
    Stats.Charisma = Stats.BaseCha + CurrentArmor.Charisma + CurrentHelm.Charisma;
    // Lunge speeds scaled:
    Atk1LungeSpeed = CurrentAnimsetData.Atk1Speed * ScaleFactor * 24.0f;
    Atk2LungeSpeed = CurrentAnimsetData.Atk2Speed * ScaleFactor * 24.0f;
    // Log all calculated values with UE_LOG

Combat:
- void PerformAttack(bool bIsStrong)
  — sphere trace from actor position in FacingDirection
  — range = (bIsStrong ? AttackRangeStrong : AttackRange) * ScaleFactor
  — radius = 30cm (UPROPERTY configurable)
  — Use UKismetSystemLibrary::SphereTraceMulti with ActorsToIgnore
    containing self + MeleeHitBuffer
  — trace channel = ECC_Pawn
  — for each hit result: Cast to ABitCharacterBase, check faction
    with CheckFaction(), call ApplyDamage
  — After first hit: add victim to MeleeHitBuffer, call PerformAttack
    again with halved damage (recursive multi-hit, max 5 recursions
    to prevent infinite loops)
  — UE_LOG every hit with attacker name, target name, damage dealt

- bool CheckFaction(ABitCharacterBase* Other) const
  — returns true if Other is a valid target (opposing faction)
  — Ally attacks Enemy: yes. Enemy attacks Ally: yes. etc.
  — Same faction: no (unless faction is Everyone)

- void ApplyDamage(ABitCharacterBase* Target, float BaseDamage,
    float DamageVariation, bool bIsStrong)
  — calculate total_damage:
    total = ((BaseDamage + FMath::FRandRange(0.f, DamageVariation))
            * Stats.STR)
            / (Target->Stats.RES * (Target->CurrentArmor.Defence
               + Target->CurrentHelm.Defence))
  — check if target is blocking with Target->IsBlockingAttack(BaseDamage)
  — if blocked:
      target enters BlockHit state
      target gets attacker's current speed/direction
      attacker bounces back (reverse FacingDirection, LaunchCharacter backward)
      UE_LOG "BLOCKED"
  — if not blocked:
      target->TakeCombatDamage(total_damage, knockback_dir, knockback_force)
      where knockback_dir = FacingDirection
      and knockback_force = CurrentLungeSpeed / AtkPushSpeedDivider
      target.ai_target = self (make AI fight back)
      UE_LOG damage dealt

- void TakeCombatDamage(float Damage, FVector KnockbackDir,
    float KnockbackForce)
  — if bInvincible: return (ignore)
  — reduce Stats.HP by Damage
  — ChangeState to Hit
  — apply knockback via LaunchCharacter(KnockbackDir * KnockbackForce)
  — set bInvincible = true, InvincibilityTimer = InvincibilityDuration
  — if Stats.HP <= 0: call Die()
  — UE_LOG HP remaining

- bool IsBlockingAttack(float IncomingBaseDamage) const
  — if bBlocking == true: return true (manual block always works)
  — if CurrentState == Block AND StateTimer <= CounterTime:
      if bIsPlayerCharacter: return true (player block always succeeds)
      else: check power threshold:
        float defensivePower = Stats.RES * (CurrentArmor.Defence
          + CurrentHelm.Defence) * (Stats.HP / 2.0f);
        return defensivePower > IncomingBaseDamage;
  — else: return false

- void Die()
  — ChangeState to Death
  — GetCapsuleComponent()->SetCollisionEnabled(ECollisionEnabled::NoCollision)
  — GetMesh()->SetCollisionEnabled(ECollisionEnabled::NoCollision)
  — UE_LOG death

Animation:
- void PlayMontageForState(EBitState State)
  — switch on State, get the corresponding montage pointer
  — if montage is valid: PlayAnimMontage(Montage, PlayRate, StartSection)
    where PlayRate = WeaponImageSpeed for attack states, 1.0 for others
    and InBlendInTime = MontageBlendInTime
  — if montage is nullptr: UE_LOG warning (so you know what's missing)

Facing:
- void FaceDirection(FVector Direction)
  — if Direction is near-zero: return
  — set TargetRotation = Direction.Rotation()
  — zero out the Pitch (we only rotate Yaw)
- void UpdateRotation(float DeltaTime)
  — smoothly interpolate current rotation toward TargetRotation
    using FMath::RInterpTo at RotationSpeed
  — call SetActorRotation with the interpolated rotation
  — called every Tick

Debug:
- Add UE_LOG(LogTemp, Warning, ...) to EVERY state change, every hit,
  every block, every damage calculation, every equipment change.
  This is essential for Day 1-2 debugging.

IMPLEMENTATION (.cpp) CONSTRUCTOR:
- bUseControllerRotationYaw = false
- bUseControllerRotationPitch = false
- bUseControllerRotationRoll = false
- GetCharacterMovement()->bOrientRotationToMovement = false
  (we handle rotation manually for precise control)
- GetCharacterMovement()->MaxWalkSpeed = 1000.f (high cap — actual
  speed controlled by input magnitude)
- GetCharacterMovement()->MaxAcceleration = 10000.f (instant accel —
  we want responsive movement like GM, not sluggish ramp-up)
- GetCharacterMovement()->BrakingDecelerationWalking = 10000.f
  (instant stop when no input)
- GetCharacterMovement()->GroundFriction = 20.f (responsive stopping)

These high acceleration/deceleration values make the CMC feel
snappy and responsive, matching GM's instant-start/instant-stop
movement model. Without these, characters feel "floaty."

Use UCLASS(Blueprintable) and ensure the class can be subclassed
in Blueprints.

Do NOT use GameplayAbilitySystem or Behavior Trees.
```

### FILE 3: BitPlayerCharacter.h / BitPlayerCharacter.cpp

**What it contains:** Player-specific code — input handling via Enhanced Input, camera, the combat release-branch logic.

**Claude Prompt to generate this file:**
```
I need you to write a UE5 C++ class called ABitPlayerCharacter for
Unreal Engine [YOUR VERSION].

This class inherits from ABitCharacterBase.
It adds: Enhanced Input for gamepad + keyboard, camera setup,
and the full combat release-branch logic from 1BIT.

IMPORTANT: Input Actions and Mapping Context are created as EDITOR
ASSETS (not in C++ code). The player character has UPROPERTY
references to them that get assigned in Blueprint defaults.

HEADER (.h):

Components:
- USpringArmComponent* SpringArm (attached to root)
  Defaults: TargetArmLength=1000, bUsePawnControlRotation=false,
  bDoCollisionTest=false, SetRelativeRotation(FRotator(-50, 0, 0)),
  bEnableCameraLag=false
- UCameraComponent* Camera (attached to SpringArm)

Input References (UPROPERTY EditAnywhere, category "Input"):
- UInputMappingContext* DefaultMappingContext
- UInputAction* MoveAction
- UInputAction* CombatAction
- UInputAction* SwapWeaponAction

Combat Input State:
- FVector2D StickDirection (current stick direction, updated every frame
  from IA_Move — needed for combat release logic)
- float StickMagnitude (current stick magnitude)
- FVector2D ClickStickDir (stick direction captured on A press)
- bool bCombatButtonHeld
- bool bBlockMontagePhase1Triggered (tracks if we already switched
  to charge montage — prevents re-triggering every frame)
- bool bBlockMontagePhase2Triggered (tracks strong charge switch)

Weapon Swapping:
- TArray<FBitWeaponData> WeaponInventory (set in Blueprint defaults)
- int32 CurrentWeaponIndex

HEADER (.h) FUNCTIONS:

Constructor:
- Create SpringArm and Camera components with defaults above
- bIsPlayerCharacter = true
- InvincibilityDuration = 1.667f (40 frames / 24fps — player's
  longer invincibility)

- virtual void BeginPlay() override
  — call Super::BeginPlay()
  — get local player's EnhancedInputLocalPlayerSubsystem
  — if DefaultMappingContext is valid: add it with priority 0
  — if DefaultMappingContext is nullptr: UE_LOG error telling user
    to assign IMC_Default in Blueprint defaults

- virtual void SetupPlayerInputComponent(UInputComponent*) override
  — cast to UEnhancedInputComponent
  — if MoveAction: bind Triggered → OnMoveInput
  — if MoveAction: bind Completed → OnMoveStop
  — if CombatAction: bind Started → OnCombatPressed
  — if CombatAction: bind Triggered → OnCombatHeld
  — if CombatAction: bind Completed → OnCombatReleased
  — if SwapWeaponAction: bind Started → OnSwapWeapon
  — if any action is nullptr: UE_LOG error listing which one is missing

Input Handlers:

- void OnMoveInput(const FInputActionValue& Value)
  — read Value as FVector2D (stick X/Y)
  — store in StickDirection, calculate StickMagnitude
  — CRITICAL: movement is CAMERA-RELATIVE. Convert stick direction
    to world direction using the camera's forward/right vectors:
      FVector CamForward = Camera->GetForwardVector();
      CamForward.Z = 0; CamForward.Normalize();
      FVector CamRight = Camera->GetRightVector();
      CamRight.Z = 0; CamRight.Normalize();
      FVector WorldDir = CamForward * StickDir.Y + CamRight * StickDir.X;
  — if bCombatButtonHeld: do NOT move (blocking), but still store
    StickDirection for use on release
  — if CurrentState is NOT Idle, Walk, or Run: return
  — dead zone: if StickMagnitude < 0.15:
      if CurrentState is Walk or Run: ChangeState(Idle)
      return
  — if StickMagnitude > 0.99: ChangeState(Run) if not already
  — else: ChangeState(Walk) if not already
  — AddMovementInput(WorldDir, speed_multiplier)
    where speed_multiplier scales with magnitude
  — FaceDirection(WorldDir) (turn character to face movement)

- void OnMoveStop(const FInputActionValue& Value)
  — StickDirection = FVector2D::ZeroVector
  — StickMagnitude = 0
  — if CurrentState is Walk or Run and NOT bCombatButtonHeld:
    ChangeState(Idle)

- void OnCombatPressed(const FInputActionValue& Value)
  — capture current StickDirection as ClickStickDir
  — set bCombatButtonHeld = true
  — reset phase tracking bools to false
  — call ChangeState(EBitState::Block)

- void OnCombatHeld(const FInputActionValue& Value)
  — bCombatButtonHeld stays true
  — StateTimer accumulates in base Tick automatically
  — if StickMagnitude > 0.15: update FacingDirection toward stick
    (so the character looks where they'll attack)

- void OnCombatReleased(const FInputActionValue& Value)
  — set bCombatButtonHeld = false
  — capture ReleaseMagnitude = StickMagnitude
  — capture ReleaseDirection = StickDirection

  IMPLEMENT THE FULL RELEASE BRANCH LOGIC from scr_block_controls.gml:

  IF ReleaseMagnitude < SwipeThreshold (no directional input):
    IF StateTimer < RollTimeThreshold:
      → ChangeState(Idle) — with gamepad, no tap-to-move destination
        exists. Player uses stick to move separately.
        (In GM this goes to Walk/Run toward the tap point, but with
        gamepad there is no tap point — just go Idle)
    ELSE (held longer):
      → find nearest enemy within AttackRangeStrong * 2 * ScaleFactor
        using FindNearestEnemy()
      → IF enemy found:
          IF StateTimer > Atk2Time → ChangeState(AttackStrong),
            FaceDirection toward enemy, set AttackLungeDirection
          ELSE IF StateTimer > Atk1Time → ChangeState(Attack),
            FaceDirection toward enemy, set AttackLungeDirection
          ELSE → set bBlocking = true, ChangeState(Idle)
            (short defensive block)
        → IF no enemy:
          set bBlocking = false, ChangeState(Idle)

  ELSE (stick has directional input, ReleaseMagnitude >= SwipeThreshold):
    — convert StickDirection to world direction (camera-relative)
    IF StateTimer > Atk2Time →
      ChangeState(AttackStrong),
      FaceDirection toward stick world direction,
      set AttackLungeDirection = stick world direction
    ELSE IF StateTimer > Atk1Time →
      ChangeState(Attack),
      FaceDirection toward stick world direction,
      set AttackLungeDirection = stick world direction
    ELSE →
      ChangeState(Roll),
      set RollDirection = stick world direction,
      FaceDirection toward roll direction

- void OnSwapWeapon(const FInputActionValue& Value)
  — read Value as float (positive = right shoulder, negative = left)
  — if WeaponInventory is empty: return
  — cycle CurrentWeaponIndex forward or backward
  — call EquipWeapon with WeaponInventory[CurrentWeaponIndex]
  — UE_LOG weapon name

- ABitCharacterBase* FindNearestEnemy(float Radius)
  — TArray<FOverlapResult> results
  — use GetWorld()->OverlapMultiByChannel centered on GetActorLocation
    with sphere radius = Radius, channel = ECC_Pawn
  — filter: Cast each to ABitCharacterBase, check CheckFaction(other),
    check other is alive (HP > 0)
  — return the nearest by distance, or nullptr if none

Override tick functions:
- virtual void TickBlock(float DeltaTime) override
  — call Super::TickBlock to handle bBlocking flag
  — montage switching at thresholds:
    if StateTimer > Atk1Time AND NOT bBlockMontagePhase1Triggered:
      PlayMontageForState — switch to AttackChargeMontage
      bBlockMontagePhase1Triggered = true
    if StateTimer > Atk2Time AND NOT bBlockMontagePhase2Triggered:
      PlayMontageForState — switch to AttackChargeStrongMontage
      bBlockMontagePhase2Triggered = true

CRITICAL NOTES FOR GENERATION:
- Do NOT create Input Actions in C++ code. They are editor assets
  referenced via UPROPERTY. If they are nullptr at runtime, log an
  error but don't crash.
- Camera-relative movement is essential. Without it, pushing "up" on
  the stick moves toward world +Y, which is disorienting in 3D.
- The camera does NOT rotate with the character or with right stick.
  It stays fixed at the SpringArm angle. This matches 1BIT's fixed
  camera and is simpler to implement.
```

### YOUR DAY 1 TASKS (after I deliver the files)

#### Task D1.1: Add C++ Files to Project
1. In Windows Explorer, navigate to your project folder: `[ProjectPath]/Source/[ProjectName]/`
2. Copy all 6 files (3 .h + 3 .cpp) into this folder
3. Close UE5 if it's open
4. Right-click your `.uproject` file → "Generate Visual Studio project files"
5. Open the `.sln` file in Visual Studio
6. Build: Ctrl+Shift+B
7. Wait for "Build: succeeded" (may take 2-5 minutes first time)
8. Open UE5

**If build fails:** Copy the full error output from Visual Studio's "Output" panel (View → Output, set dropdown to "Build") and paste them to me. The most common errors are:
- Missing includes → I fix the code
- API changes between engine versions → I fix the code
- Module dependencies missing (e.g. EnhancedInput) → I add the module to the .Build.cs file

#### Task D1.2: Create DataTables
1. In Content Browser, right-click → Miscellaneous → Data Table
2. Pick "BitAnimsetData" as the row structure → Name it "DT_Animsets"
3. Double-click to open, add 7 rows (one per weapon type):
   - Row name "Hands": Atk1TimeFrames=8, Atk2TimeFrames=20, AttackRange=13, AttackRangeStrong=15, Atk1Speed=4, Atk1SpeedDecrease=0.3, Atk2Speed=6, Atk2SpeedDecrease=0.2, AnimsetWeaponImageSpeed=1
   - Row name "Dagger": 10, 40, 16, 18, 4, 0.3, 5, 0.4, 1
   - Row name "Sword": 15, 40, 18, 19, 5, 0.3, 6, 0.4, 1
   - Row name "Staff": 15, 40, 20, 24, 5, 0.3, 6, 0.4, 1
   - Row name "Katana": 10, 60, 20, 21, 6, 0.5, 8, 0.6, 1
   - Row name "Shotgun": 5, 20, 5, 10, -4, 0.4, -6, 0.5, 1
   - Row name "None": 10, 20, 13, 15, 4, 0.3, 6, 0.2, 1

4. Create another Data Table with "BitWeaponData" → Name it "DT_Weapons"
5. Add 4-5 weapons to start:
   - "BareHands": Index=0, Name="bare hands", Animset=Hands, Price=0, Weight=0, AtkDmgLight=0.5, AtkDmgStrong=1, AtkDmgVariation=0.5, AtkSpd=1.1, Bullets=0
   - "RustyDagger": Index=23, Name="rusty dagger", Animset=Dagger, Price=25, Weight=1, AtkDmgLight=1, AtkDmgStrong=1.5, AtkDmgVariation=1.25, AtkSpd=1
   - "SharpSword": Index=34, Name="sharp sword", Animset=Sword, Price=90, Weight=6, AtkDmgLight=2, AtkDmgStrong=2.75, AtkDmgVariation=1, AtkSpd=1
   - "LargeClaymore": Index=35, Name="large claymore", Animset=Sword, Price=100, Weight=20, AtkDmgLight=2, AtkDmgStrong=4, AtkDmgVariation=2, AtkSpd=0.666

#### Task D1.3: Create Player Blueprint
1. In Content Browser, right-click → Blueprint Class → expand "All Classes" → search "BitPlayerCharacter" → select it → name it "BP_Player"
2. Double-click to open
3. Select the **Mesh** component in the component hierarchy (left panel)
4. In the Details panel on the right:
   - Set "Skeletal Mesh Asset" = your imported character mesh
   - Set "Anim Class" = ABP_BitCharacter (the minimal AnimBP from Pre-Work Task P7)
5. Go to the Class Defaults (click "Class Defaults" button at the top toolbar)
6. Under "Input" category:
   - Set DefaultMappingContext = IMC_Default
   - Set MoveAction = IA_Move
   - Set CombatAction = IA_Combat
   - Set SwapWeaponAction = IA_SwapWeapon
7. Under "Animation" category:
   - Assign each montage slot (IdleMontage, WalkMontage, RunMontage, BlockMontage, RollMontage, AttackMontage, AttackStrongMontage, AttackChargeMontage, HitMontage, DeathMontage)
   - If you don't have a separate AttackChargeStrongMontage, use the same as AttackChargeMontage
8. Under "Equipment":
   - Set AnimsetDataTable = DT_Animsets
   - Set WeaponDataTable = DT_Weapons
9. Under "Camera" (look at the SpringArm component):
   - TargetArmLength = 1000 (adjust to taste — higher = more zoomed out)
   - Rotation = (-50, 0, 0) for top-down-ish angle
10. Save

#### Task D1.4: Set Player Blueprint as Default Pawn
1. Edit → Project Settings → Maps & Modes
2. Under "Default Modes", set Default Pawn Class = BP_Player
3. Make sure there's a Player Start in your test level

#### Task D1.5: Test
1. Press Play in the viewport
2. Check the Output Log (Window → Developer Tools → Output Log) for any red or yellow messages
3. Test left stick — character should move, camera-relative
4. Press A — character should enter block (block montage plays)
5. Hold A — watch the Output Log for state timer advancing. When timer crosses Atk1Time, charge montage should switch
6. Release A — character should return to idle
7. Release A while holding stick in a direction — should trigger roll

**What to report to me:**
- Does the character appear and move? If not, paste the Output Log errors
- Does block trigger on A press? If not, check that IA_Combat is assigned
- Do montages play? If not, check that ABP_BitCharacter is assigned in the Mesh component's Anim Class
- Does the character rotate to face movement direction?
- Any crashes or red text in Output Log?

---

## DAY 2 — HIT DETECTION + ENEMY + DAMAGE

### C++ FILES TO ADD

Two new files. Same process: add to Source folder, close UE5, regenerate project, build, reopen.

### FILE 4: BitAttackNotify.h / BitAttackNotify.cpp

**Claude Prompt:**
```
I need a UE5 custom AnimNotify called UBitAttackNotify for
Unreal Engine [YOUR VERSION].

When this notify fires during a montage, it should:
1. Get the owning actor from the MeshComp's owner
2. Cast to ABitCharacterBase
3. Call PerformAttack(bIsStrongAttack) on that character

The notify should have one UPROPERTY(EditAnywhere):
- bool bIsStrongAttack (so the notify knows which attack type.
  Default false for light attacks)

This should be a UAnimNotify (single-frame), NOT UAnimNotifyState.

Override Notify() with the proper signature for [YOUR VERSION]:
  virtual void Notify(USkeletalMeshComponent* MeshComp,
    UAnimSequenceBase* Animation,
    const FAnimNotifyEventReference& EventReference) override;

Set NotifyColor to FColor::Red for visibility in the montage editor.
Override GetNotifyName to return "Attack Hit Frame".

Include "BitCharacterBase.h".
```

### FILE 5: BitEnemyCharacter.h / BitEnemyCharacter.cpp

**Claude Prompt:**
```
I need you to write a UE5 C++ class called ABitEnemyCharacter for
Unreal Engine [YOUR VERSION].

This class inherits from ABitCharacterBase.
It adds tick-based AI that uses the same combat state machine.
NO Behavior Trees, NO AI Controller, NO NavMesh — just tick logic.

HEADER (.h) PROPERTIES:

AI State:
- EBitAIState AIState (default Guard)
- EBitAIState OriginalAIState (saved original)
- ABitCharacterBase* AITarget (who they're fighting — use base class
  pointer so it works with player and other NPCs)
- float AISearchRange (80.0 — in GM pixels, multiplied by ScaleFactor)
- float AITimerAttack (countdown between attacks, counts down each tick)
- float AITimerAttackMin (1.667s, from ai_timer_attack1 = 40 frames)
- float AITimerAttackMax (2.083s, from ai_timer_attack2 = 50 frames)
- float AIResponsiveness (0.167s, from ai_responsiveness = 4 frames)
- float AIAlertTimer (counts up during Alert state until
  AIResponsiveness reached)
- FVector GuardPosition (saved on BeginPlay — where they stand idle)
- float AIBlockChance (0-1, chance to preemptively block. Default 0.3)
- float AIHoldDuration (randomized on entering Block — how long AI
  holds before releasing to attack)

HEADER (.h) FUNCTIONS:

Constructor:
- bIsPlayerCharacter = false
- InvincibilityDuration = 0.125f (3 frames / 24fps)
- Faction = EBitFaction::Enemy (default for enemies)

- virtual void BeginPlay() override
  — call Super
  — set GuardPosition = GetActorLocation()
  — set OriginalAIState = AIState

- virtual void Tick(float DeltaTime) override
  — call Super::Tick (runs state machine from base class)
  — call TickAI(DeltaTime)

- void TickAI(float DeltaTime)
  — if CurrentState is Death: return
  — if CurrentState is Hit, Roll, Attack, AttackStrong, BlockHit:
    return (let the state machine handle these — AI doesn't
    override mid-animation)
  — switch on AIState:

    Guard:
      Stand at GuardPosition (if distance > 50cm, walk toward it).
      Scan for player: find nearest ABitCharacterBase within
        AISearchRange * ScaleFactor that passes CheckFaction().
      If found → set AITarget, AIState = Alert, AIAlertTimer = 0.

    Alert:
      AIAlertTimer += DeltaTime.
      FaceDirection(toward AITarget).
      If AIAlertTimer >= AIResponsiveness → AIState = Chase.

    Chase:
      If AITarget is dead or nullptr → AIState = Guard.
      Move toward AITarget using AddMovementInput.
      FaceDirection(toward AITarget).
      Set state to Walk or Run based on distance.
      If distance < AttackRangeStrong * ScaleFactor → AIState = Fight,
        AITimerAttack = FMath::FRandRange(AITimerAttackMin * 0.5, AITimerAttackMin).
      If distance > AISearchRange * ScaleFactor * 1.5 → AIState = Guard
        (lost interest).

    Fight:
      FaceDirection(toward AITarget).
      If distance > AttackRangeStrong * ScaleFactor * 1.5 → AIState = Chase.
      If AITimerAttack > 0: count down. Stay in Idle state (circling).
      Else:
        — Decide hold duration:
          AIHoldDuration = FMath::FRandRange(Atk1Time * 0.8, Atk2Time * 1.2)
        — ChangeState(Block)
        — The AI's TickBlock override handles the timed release

    Flee:
      Move away from AITarget using AddMovementInput.
      If distance > AISearchRange * ScaleFactor * 2 → AIState = Guard.

- void OnTakeDamageAI(ABitCharacterBase* Attacker)
  — set AITarget = Attacker
  — AIState = Fight
  — call CalculateFleeChance
  — if flee roll succeeds → AIState = Flee

- float CalculateFleeChance(ABitCharacterBase* Attacker) const
  — implements the flee formula from scr_attack_system EXACTLY:
    hp_factor = (1.0f - Stats.HP/Stats.MaxHP) * 15.0f
    str_factor = ((Attacker->Stats.STR / Stats.RES) - 1.0f) * 5.0f
    charisma_fear = ((Attacker->Stats.Charisma + FMath::Abs(Stats.Charisma)) * -8.0f)
    flee_chance = (hp_factor + str_factor + charisma_fear)
                  / (FMath::Abs(Stats.Charisma) + 1.0f)
    return flee_chance
  — called when taking damage. If FMath::FRandRange(0, 100) < flee_chance
    AND Faction != Zombie → AIState = Flee

- virtual void TickBlock(float DeltaTime) override
  — call Super::TickBlock (handles bBlocking flag)
  — AI RELEASE LOGIC: when StateTimer >= AIHoldDuration:
      FaceDirection(toward AITarget)
      set AttackLungeDirection toward AITarget
      if AIHoldDuration > Atk2Time → ChangeState(AttackStrong)
      else → ChangeState(Attack)
      AITimerAttack = FMath::FRandRange(AITimerAttackMin, AITimerAttackMax)

- Preemptive blocking:
  In TickAI during Fight state, check if AITarget is in Attack or
  AttackStrong state. If so, roll against AIBlockChance. If success
  AND current state is Idle: ChangeState(Block) preemptively.

IMPLEMENTATION NOTES:
- Movement uses AddMovementInput toward target, NOT pathfinding.
  Enemies walk straight at you. For the prototype this is fine.
- AI must use the SAME PerformAttack, ApplyDamage, TakeCombatDamage
  as the player (inherited from BitCharacterBase).
- Wire TakeCombatDamage to call OnTakeDamageAI so enemies react
  (this can be done by overriding TakeCombatDamage in the enemy class
  to call Super then OnTakeDamageAI)
- Add UE_LOG for every AI state transition for debugging.
```

### YOUR DAY 2 TASKS

#### Task D2.1: Add New Files + Rebuild
Same process as Day 1 — add 4 new files (2 .h + 2 .cpp), close UE5, regenerate project files, build in Visual Studio, reopen.

#### Task D2.2: Add Attack Notifies to Montages
For each attack montage (AttackMontage, AttackStrongMontage):
1. Double-click the montage to open it
2. In the timeline at the bottom, you'll see a "Notifies" row
3. Right-click on the Notifies row → Add Notify → search "BitAttackNotify" (or "Attack Hit Frame")
4. A red marker appears on the timeline. Drag it to the exact frame where the weapon connects (the impact frame of the animation)
5. Click the notify marker. In the Details panel, you'll see "Is Strong Attack" checkbox
6. For AttackStrongMontage: check "Is Strong Attack"
7. For AttackMontage: leave it unchecked
8. Save both montages

#### Task D2.3: Create Enemy Blueprint
1. Content Browser → right-click → Blueprint Class → expand All Classes → search "BitEnemyCharacter" → name it "BP_Enemy"
2. Double-click to open
3. Select the Mesh component:
   - Set Skeletal Mesh = your character mesh (same as player, or different if you have one)
   - Set Anim Class = ABP_BitCharacter (same minimal AnimBP)
4. In Class Defaults:
   - Assign the same montages as the player (or enemy-specific ones)
   - Set AnimsetDataTable = DT_Animsets
   - Set WeaponDataTable = DT_Weapons
   - Under Stats: HP=3, STR=1.5, RES=1, SPD=1
   - Set Faction = Enemy
5. Save
6. Drag 2-3 BP_Enemy instances into the test level
7. Space them out (at least 500cm apart) so you can approach them individually

#### Task D2.4: Test Combat
1. Press Play
2. Walk up to an enemy — watch the Output Log: you should see "AI State: Guard → Alert → Chase"
3. Press and hold A briefly (< Atk1Time) then release with stick toward enemy → should roll
4. Press and hold A longer then release → should attack
5. Hold even longer → strong attack
6. Watch for "HIT" and "DAMAGE" messages in the Output Log
7. Let the enemy hit you — you should take damage (check Output Log)
8. Try blocking: hold A while enemy attacks you
9. Try killing an enemy (keep attacking until their HP reaches 0)

**What to report:**
- Does the attack visually connect? (trace range might need adjustment)
- Does the Output Log show damage numbers?
- Does blocking work? (should see "BLOCKED" in log)
- Does the enemy chase and attack back?
- Knockback direction correct? (target should fly AWAY from attacker)
- Any crashes? Paste the full crash log.

---

## DAY 3 — WEAPON SYSTEM + POLISH + TUNING

### C++ UPDATES

I will deliver updated files or new files for:
- Bug fixes from Day 2 testing
- Hit feedback (hit-stop, camera shake)
- Debug HUD
- Armor/helm equipment integration

### FILE 6: BitDebugHUD.h / BitDebugHUD.cpp

**Claude Prompt:**
```
I need a simple UE5 HUD class called ABitDebugHUD for
Unreal Engine [YOUR VERSION] that inherits from AHUD.

Override DrawHUD() to draw on-screen debug text using
DrawText() and DrawRect():

TOP-LEFT corner — Player info:
- "State: [name]" (use a switch or TMap to convert EBitState to FString)
- "Timer: [StateTimer]s"
- "Blocking: [yes/no]"
- "Weapon: [name] (atk_spd: [value])"
- "HP: [current]/[max]"
- "Atk1Time: [value]s  Atk2Time: [value]s"
- "DefenceSpeed: [value]  WeaponImgSpd: [value]"
- "Faction: [name]"

Find all ABitCharacterBase in the level (use
TActorIterator<ABitCharacterBase>). For enemies only:
- Project their GetActorLocation() to screen coords using Project()
- Draw a health bar above their head: red background rect, green
  foreground rect scaled by HP/MaxHP
- Draw their name and AI state below the bar

Use white text, size 14, no special font needed.
Use AddDrawDebugText or basic Canvas->DrawText.

Set this as the default HUD class either in the GameMode Blueprint
or by creating a custom GameMode that references it.
```

### FILE 7: Hit-Stop Implementation

**Claude Prompt (update to BitCharacterBase):**
```
Add hit-stop functionality to ABitCharacterBase for
Unreal Engine [YOUR VERSION].

When PerformAttack successfully hits a target (damage is dealt,
not blocked), trigger a brief hit-stop effect:

Implementation approach (SAFE — does not affect state timers):
1. Add properties:
   - bool bHitStopActive (default false)
   - float HitStopDuration (default 0.04s — configurable)
   - float HitStopTimer (counts down)
   - float HitStopTimeScale (default 0.05 — near-frozen)

2. When a hit connects in ApplyDamage (not blocked):
   — On BOTH attacker and target: set bHitStopActive = true,
     HitStopTimer = HitStopDuration
   — Call GetMesh()->bPauseAnims = true (freeze animation)
   — Do NOT change CustomTimeDilation (this would affect state timers)

3. In Tick, BEFORE processing the state machine:
   — if bHitStopActive:
       HitStopTimer -= GetWorld()->GetDeltaSeconds() (uses real time)
       if HitStopTimer <= 0:
         bHitStopActive = false
         GetMesh()->bPauseAnims = false
       return; (skip state machine processing this frame)

This freezes the character's animation and state machine for ~2 frames
at 60fps, creating the classic hit-stop feel without affecting
global time dilation or other characters' timers.

4. Add a camera shake call on hit (on the player character only):
   — In ApplyDamage, after dealing damage, if the attacker or target
     is the player: call APlayerController::ClientStartCameraShake
     with a simple shake class (or use
     UGameplayStatics::PlayWorldCameraShake if preferred)
   — The shake should be small: 2-4cm displacement, 0.15s duration
```

### YOUR DAY 3 TASKS

#### Task D3.1: Fill DataTables with More Weapons
Open DT_Weapons and add more entries from the CSV. Key weapons to test the weapon weight system:
- "SpeedVials" (index 13): AtkSpd=2.0, AtkDmgLight=1, AtkDmgStrong=1.5, Weight=0.05 — very fast, halves all timing
- "BruteForcePills" (index 12): AtkSpd=0.5, AtkDmgLight=0.25, AtkDmgStrong=3, Weight=0.05 — very slow, doubles timing, massive strong attack
- "BoStaff" (index 46): AtkSpd=1.6, Animset=Staff — fast staff
- "ExtremeKatana" (index 57): AtkSpd=1.25, AtkDmgLight=4, AtkDmgStrong=6, Animset=Katana — fast and powerful

Swap between these with shoulder buttons. You should FEEL the timing change.

#### Task D3.2: Create Armor/Helm DataTables
1. Create DT_Armors (BitArmorData row structure):
   - "Naked": Defence=0.5, Weight=0, Charisma=0
   - "WarmPelt": Defence=1.05, Weight=2, Charisma=0
   - "RustyChainmail": Defence=1.15, Weight=8, Charisma=0
   - "MetalPlate": Defence=1.25, Weight=25, Charisma=0
2. Create DT_Helms (BitHelmData row structure):
   - "NoHeadwear": Defence=1, Weight=0, Charisma=0
   - "StrayHat": Defence=1.05, Weight=0.5, Charisma=0
   - "GuardHelm": Defence=1.15, Weight=1, Charisma=0
   - "RustyHelm": Defence=1.5, Weight=3, Charisma=0
3. Assign armor and helm to BP_Enemy variants (in their Blueprint defaults)

#### Task D3.3: Create Enemy Variants
Duplicate BP_Enemy several times in the Content Browser:
- "BP_Enemy_Fast": equip dagger + WarmPelt, SPD=1.5, STR=0.75
- "BP_Enemy_Heavy": equip LargeClaymore + MetalPlate, SPD=0.5, STR=2, HP=5
- "BP_Enemy_Katana": equip ExtremeKatana + Naked, SPD=1.5, STR=1.5, HP=2
Place them all in the test level alongside the basic enemy.

#### Task D3.4: Set Up Debug HUD
1. Create a Blueprint child of ABitDebugHUD if needed, or just use it directly
2. In your level's World Settings (or in a custom GameMode Blueprint), set HUD Class = BitDebugHUD
3. Play and verify you see state/timer/HP info on screen

#### Task D3.5: Tune
Play the game. Compare the feel to 1BIT. Report SPECIFIC issues:
- "Blocking window feels too short/long" → I adjust Atk1Time scaling
- "Roll distance is too far/short" → I adjust RollSpeed or deceleration
- "Heavy weapons don't feel heavy enough" → I adjust AtkSpd divisor
- "Enemy attacks too fast/slow" → I adjust AI timer values
- "Attack doesn't reach the enemy" → I adjust ScaleFactor or trace radius
- "Movement feels floaty/sluggish" → I adjust CMC acceleration values
I will adjust the values based on your feedback.

---

## END OF DAY 3 DELIVERABLE

You should have:
- One player character moving with gamepad (camera-relative)
- Full hold → block → release → roll/attack/strong attack flow
- Timing driven by weapon type AND individual weapon atk_spd
- Multiple weapon types feeling different (fast daggers vs slow claymores)
- 3+ enemy variants fighting back with the same combat system
- Weapon swapping with shoulder buttons
- Damage calculation matching 1BIT's formula exactly
- Block with power threshold (NPCs only — player always blocks)
- Multi-hit recursive damage (halved per target)
- Knockback (target flies away, attacker bounces on blocked hit)
- Invincibility frames (1.667s player, 0.125s enemy)
- Hit-stop on damage (animation freeze, not time dilation)
- Debug HUD showing all combat values in real-time
- Camera shake on hits

---

## RISK LOG

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| C++ build errors from engine version | HIGH | 1-2 hours per occurrence | Tell me exact error, I fix immediately. Most common: missing module in .Build.cs |
| Build.cs missing EnhancedInput module | HIGH | 5 min if caught, 1 hour if not | Pre-Work now includes explicit Build.cs step. If build error mentions "EnhancedInput": add it to Build.cs |
| Montage not playing (silent fail) | MEDIUM | 30 min | Verify: is ABP_BitCharacter assigned in Mesh→Anim Class? Is the montage using the right skeleton? Check Output Log for my UE_LOG warnings |
| Enhanced Input not responding | MEDIUM | 30 min | Verify: is IMC_Default assigned in BP_Player defaults? Are IA_Move/IA_Combat/IA_SwapWeapon assigned? Check Output Log for my "nullptr" warnings |
| WASD composite input setup | MEDIUM | 30 min | The Swizzle/Negate modifier setup varies by engine version. If WASD doesn't work, skip it for now — test with gamepad. I'll fix the WASD mapping for your specific version |
| Sphere trace missing enemies | MEDIUM | 30 min | ScaleFactor too low. Increase from 10 to 15 or 20. Or increase trace radius. I add debug sphere visualization |
| Character falling through floor | LOW | 15 min | Verify: floor has collision. Character has capsule. Floor uses "BlockAll" preset |
| Movement feels floaty | MEDIUM | 15 min | CMC MaxAcceleration and BrakingDeceleration need tuning. I set them high (10000) by default to match GM's instant movement |
| Camera angle wrong | LOW | 5 min | Change SpringArm rotation in BP_Player. Pitch -50 is top-down-ish, -30 is more over-shoulder |
| T-pose flash between states | LOW | 10 min | Idle montage isn't set to loop, or a montage slot is empty. Check Output Log for my "montage nullptr" warnings |

---

## NOTES ON FUTURE-PROOFING

### Switching from Constant to Linear Interpolation
Each animation asset in UE5 has its own curve interpolation setting.
To switch from snappy (constant) to smooth (linear):
1. Open the animation asset (not the montage)
2. In the curve editor, select all curves
3. Change interpolation from "Constant" to "Linear" or "Cubic"
4. The montage will automatically use the updated animation

This is per-animation, completely independent of the C++ code.

### Adding Blend Between Montages
In the Blueprint defaults of your character:
- Increase MontageBlendInTime from 0.0 to 0.1-0.2
- In each Montage asset, increase BlendOut time from 0.0 to 0.1-0.2
This adds smooth transitions between states. The C++ code already passes MontageBlendInTime to PlayAnimMontage.

### Adding Touch Controls Later
This would be a Day 4 addition. It involves:
- Creating a new Input Action for touch
- Mapping touch press/release to the same OnCombatPressed/Released handlers
- Adding swipe detection (capture touch position on press and release, calculate distance and direction)
- This reuses 100% of the existing combat logic — only the input source changes

Estimated time: 1 day if the gamepad version is working and feeling good.

### Adding More Weapon Animsets
If you want different attack animations per weapon type (swords slash differently than daggers):
- Create separate montages per animset (AM_Attack_Sword, AM_Attack_Dagger, etc.)
- Add a TMap<EBitWeaponAnimset, UAnimMontage*> to the character for per-animset montage overrides
- EquipWeapon swaps the active montage set
- This is a small C++ change (~20 lines) I can deliver when you're ready

---

## COMPLETE FILE LIST

| File | Day | Purpose |
|---|---|---|
| BitCombatTypes.h | 1 | Enums, DataTable row structs, runtime structs |
| BitCharacterBase.h + .cpp | 1 | Base character: state machine, combat, equipment, animation |
| BitPlayerCharacter.h + .cpp | 1 | Player: input, camera, combat release logic |
| BitAttackNotify.h + .cpp | 2 | AnimNotify: triggers sphere trace on attack frame |
| BitEnemyCharacter.h + .cpp | 2 | Enemy: tick-based AI using same state machine |
| BitDebugHUD.h + .cpp | 3 | Debug overlay: state, HP bars, combat values |
| (Updates to BitCharacterBase) | 3 | Hit-stop, camera shake, armor/helm integration |

Total: 7 header files + 6 source files = 13 files.
