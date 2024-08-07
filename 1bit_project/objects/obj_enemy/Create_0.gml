// Inherit the parent event obj_enemy
event_inherited();

character_head=choose(spr_head,spr_head_infected);
skin_color=c_orange;
main_color=c_white;
speech_color=c_orange;

control=controls.ai;
faction=factions.enemy;
equip_weapon(global.weapons[irandom_range(0,29)]);//15
equip_armor(global.armors[irandom_range(0,20)]);
equip_helm(global.helms[irandom_range(0,20)]);
ai_type=ai_types.ai_test;

ai_responsiveness=3//animset_atk2_time//20;//irandom_range(10,50);

blocking_timer=0;
