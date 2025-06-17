// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_sm_death(){
	if blood_active==true {instance_create_depth(x,y,-y,obj_fx_blood);}
	
	var dead_man=instance_create_depth(x,y,-y,obj_dead);
	dead_man.death_1_a=death_1_a;
	dead_man.death_1_b=death_1_b;
	dead_man.death_2_a=death_2_a;
	dead_man.death_2_b=death_2_b;
	dead_man.death_3_a=death_3_a;
	dead_man.death_3_b=death_3_b;
	dead_man.size=size;
	dead_man.sprite_shadow=sprite_shadow;
	dead_man.sprite_skin=sprite_skin;
	dead_man.sprite_body=sprite_body;
	dead_man.helm.sprite=helm.sprite;
	dead_man.character_head=character_head;
	dead_man.character_body=character_body;
	dead_man.skin_color=skin_color;
	dead_man.main_color=main_color;
	
	if (irandom_range(0,100))<drop_rate
	{
		var dead_shop=instance_create(obj_ui_shop);
		var assigned_weapon=weapon;
		var assigned_armor=armor;
		var assigned_helm=helm;
		var assigned_name=name;
		with dead_shop
		{
			equip_weapon(assigned_weapon);
			equip_armor(assigned_armor);
			equip_helm(assigned_helm);
			name=assigned_name;
			given_name=choose(name, name, name, name, name, name, name, name,"corpse","corpse","corpse","corpse","cadaver","cadaver","body","body","body","body","body","body","fool","body");
			var sense=choose("eye","ear","eye","ear","touch","nose","tongue","other","other");
			var part1="";
			var part2="";
			switch sense
			{
				case "eye":
					var part1=choose(
					" has seen better days",
					" has been torn to pieces",
					"'s guts are spilled",
					" doesn't have much left",
					" is definitely dead",
					"'s skin has been torn to shreads",
					" is missing its "+choose("left","right")+" arm",
					" is missing its head",
					" is missing its "+choose("left","right")+" leg",
					" is missing both legs",
					" is missing both arms",
					" looks like its been through some pain",
					" suffered a lot before dying",
					"'s eyes are wide open",
					" has a terrified look on its face",
					"'s brains spilled out of its head",
					" is dead");
				break;
				case "ear":
					var part1=choose(
					" has worms coming out of his ears",
					" is missing half of his face",
					"'s silence is intensified by the sound of the wind",
					"'s brains are spilling from its "+choose("left","right")+" ear",
					" doesn't have a pulse",
					"'s heart stopped beating",
					" is infested by loud flies",
					"'s blood keeps dripping",
					" has screamed a lot before dying",
					" stopped breathing",
					" is partially alive",
					" is trying to whisper something",
					" is still coughing",
					" is still somewhat breathing",
					" is praying as its life is fading",
					" is telling me that it wants to go home",
					"'s face is buried in the mud",
					"'s ear has been cut off",
					" died tragically");
				break;
				case "touch":
					var part1=choose(
					" has been through better days",
					"'s skin is full of cuts and bruises",
					" has cuts all over its body",
					"'s knuckles are all scratched",
					" lost a lot of blood",
					"'s hand is still somewhat moving",
					"'s chest was brutally crushed",
					"'s skin was cut open",
					" is trying to grab on something",
					" has a terrified look",
					"'s bones have been cracked",
					"'s skull has been split in half",
					" has nothing left to lose",
					" has been crushed");
				break;
				case "nose":
					var part1=choose(
					" reeks of putrefaction",
					" smells like rotten meat",
					"'s nose has been chopped off",
					" fills the air with an uncomfortable smell",
					"'s smell is unsettling",
					" has a very unique smell",
					" doesn't seem to have a smell",
					" smells like fresh blood",
					" reeks",
					"'s stench is "+choose("intorelable","unbearable","oppressive","insupportable"),
					"'s odor forces you to cover your nose",
					"'s clothes have a particular kind of smell",
					" reeks terribly");
				break;
				case "tongue":
					var part1=choose(
					"'s smell sticks to my tongue",
					"'s jaw is split open",
					" will be "+choose("eaten by ","food for ","consumed by ")+choose("crows","insects","bugs","worms","ants","wolves","snakes"),
					" is already decomposing",
					" is rotting already",
					" is still trying to speak",
					"'s tongue is still moving",
					"'s mouth is twitching",
					"'s teeth have been broken",
					" is heavily bruised",
					"'s face can't be recognized anymore",
					" puked its recent meal");
				break;
				default:
					var part1=choose(
					" is clearly dead"," is no longer alive"," has deceased"," is no longer moving"," has died"," is still breathing");
				break;
			}
			var part2=choose(".","...",". It's not a pretty sight.","... not much left of it.",". Makes me uncomfortable.","!",".",".",".",".",".",".",".",".",".",".",".",".",".",".",".",".",".",".",".",".",".",".",".",".",".","","","");
			var description_chance=irandom_range(0,100);
			if description_chance>90{description="this "+given_name+part1/*+part2;*/} else {description="dead "+name};
		}
	}
	
	instance_destroy();
	
	var xp_points=instance_create(obj_xp);
	
	if instance_exists(xp_points) {
		xp_points.xp_value=((str*weapon.atk_dmg_light*weapon.atk_dmg_strong)+(res*armor.defence*helm.defence)+hp_max)*spd;
	}
}