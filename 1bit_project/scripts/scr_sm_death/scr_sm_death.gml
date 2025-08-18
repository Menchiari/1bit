// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_sm_death(){
	scr_audio_death(image_index,1);
	speed=0;
	path_end();
	
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
	
	//Spawn death text
	if irandom_range(0,100)<=dialogue_death_chance
	{
		dialogue_death_instance=instance_create_depth(x,y-16,-y,obj_ui_number)
		scr_audio_yell(image_index,1);
		dialogue_death_instance.text=dialogue_death;
		if dialogue_death==""
		&& animal==false
		{
			if (faction == factions.enemy)

			{
				dialogue_death_instance.text = choose(
					"damn\nyou!",
					"this can't\nbe",
					"how\ndare you",
					"nooo...",
					"I\ncan't..",
					"you\nfool..",
					"you\nbastard",
					"you\ncoward..",
					"help...",
					"I'm\nsorry",
					"well\ndone",
					"oh,\nshit.",
					"fuck..",
					"waaaaahh!!",
					"ooooohhhh",
					"sgharbfh..",
					"not\nlike this",
					"impossible...",
					"bastard...",
					"traitor...",
					"liar...",
					"kill me\nthen!",
					"you'll\npay...",
					"this isn't\nover",
					"you\nfilth...",
					"no...\nno...",
					"they warned\nme...",
					"shit...",
					"ugh...",
					"you got\nlucky...",
					"broke\nme...",
					"how...?",
					"dammit...",
					"I was...\nwinning...",
					"fuck\nyou...",
					"no\nmercy...",
					"coward...",
					"I see\nnow...",
					"worthless...",
					"cheated...",
					"cut me\ndown...",
					"still\nstanding?",
					"my\neyes...",
					"aghhh...",
					"no\nstrength...",
					"not\nyet...",
					"I'll\nreturn...",
					"you'll\nrot...",
					"ha...\nha...",
					"damn...",
					"fuck...\noff...",
					"got\nsloppy...",
					"should've\nrun...",
					"your turn\nsoon...",
					"not...\nlike this...",
					"so\ncold...",
					"it's\ndark...",
					"bleeding...\nout...",
					"I see\nthem...",
					"they're\nwaiting...",
					"you're\nnext...",
					"not yet...\nnot...",
					"my...\nweapon...",
					"take...\nit...",
					"burn...\nyou...",
					"choked\non blood...",
					"you\ncheated...",
					"no honor...\ndog...",
					"I...\nhate you...",
					"you\ndie next...",
					"mother...\nforgive...",
					"I feel...\nnothing...",
					"legs...\nwon't move...",
					"my\nlungs...",
					"broken...\nribs...",
					"can't...\nbreathe...",
					"face...\nfirst...",
					"crushed...\nskull...",
					"you're\nnot better...",
					"should've\nfinished it...",
					"never\nforget...",
					"cut...\ndeep...",
					"death...\ncalls...",
					"flesh...\nripped...",
					"bones...\nbare...",
					"ha...\nfucking ha...",
					"what\na joke...",
					"I...\ndid my best...",
					"try...\nagain...",
					"your\nface...",
					"no...\nplease...",
					"kill...\nthem all...",
					"the pain...\ngone...",
					"don't...\nstop...",
					"wasn't...\nready...",
					"you're...\nnot human...",
					"we were...\nwrong...",
					"blood...\nso much...",
					"everything...\nfades...",
					"my...\nend...",
					"this...\nis it...",
					"...",
					""
				);
			}
			else
			{
				dialogue_death_instance.text = choose(
					"why...?",
					"what have\nI done to you?",
					"what...?",
					"oh\nno...",
					"...",
					"I'm\nsorry...",
					"why?!",
					"oh..\nno..",
					"mercy...",
					"please\nno...",
					"god\nno!",
					"so...\nis this it?",
					"I beg\nyou...",
					"not\nme...",
					"forgive\nme...",
					"it\nhurts...",
					"don't\nleave...",
					"stay...\nsafe...",
					"I didn't...",
					"tell\nthem...",
					"my\nname...",
					"my\nchild...",
					"it's\ncold...",
					"I don't...\nwant to go...",
					"I was\nafraid...",
					"not\nready...",
					"I saw it\ncoming...",
					"so\ntired...",
					"don't\ncry...",
					"was it...\nworth it?",
					"don't\nforget...",
					"my\nhome...",
					"my\nlove...",
					"tell\nher...",
					"tell\nhim...",
					"I hear\nthem...",
					"the\nlight...",
					"too\nsoon...",
					"please...",
					"so\ndark...",
					"hold\nme...",
					"I\ntried...",
					"I\nfailed...",
					"stay with\nme...",
					"just a bit\nmore...",
					"one more\nstep...",
					"you...\ncame...",
					"this isn't\nfair...",
					"don't...\nunderstand...",
					"we had\ntime...",
					"no one\nelse...",
					"she'll\nwait...",
					"I don't\nblame you...",
					"will they\nknow?",
					"I...\nsee you...",
					"I'm\nscared...",
					"where\nam I...",
					"my...\nvoice...",
					"they were\nright...",
					"I hear\nher...",
					"I see\nhis face...",
					"my...\nfamily...",
					"was I\nwrong?",
					"I should've\nrun...",
					"we were\nso close...",
					"not\nlike this...",
					"help...\nme...",
					"save...\nyourself...",
					"take...\ncare...",
					"this can't\nbe real...",
					"no...\nno...",
					"do you\nremember?",
					"just one\nmore day...",
					"too much...\nblood...",
					"can't\nfeel...",
					"what's\nhappening...",
					"stay...\nalive...",
					"don't let\nthem win...",
					"it's...\nokay...",
					"make it\nmean something...",
					"they\nneed you...",
					"hold my\nhand...",
					"the\nsun...",
					"I was...\ngood, right?",
					"I'm...\nready...",
					"thank\nyou...",
					"tell them...\nI tried...",
					"don't tell\nher...",
					"I...\nwasn't enough...",
					"I want to...\nremember...",
					"was that...\nit?",
					"I hear...\nbells...",
					"no...\nregrets...",
					"so...\nmuch pain...",
					"you're...\nfree now...",
					"leave\nme...",
					"I'll be...\nokay...",
					"it's...\ndone...",
					"...",
					""
				);
			}
		}
		dialogue_death_instance.speed=0;
		dialogue_death_instance._color=speech_color;
		dialogue_death_instance.spdy=.25;
		dialogue_death_instance.spdx=random_range(-.1,.1);
		dialogue_death_instance.duration=game_get_speed(gamespeed_fps)*dialogue_death_duration;
	}
	
	instance_destroy();
	
	//create XP points
	if object_index!=obj_hero
	{
		var xp_points=instance_create(obj_xp);
	
		if instance_exists(xp_points)
		{
			xp_points.xp_value=((str*weapon.atk_dmg_light*weapon.atk_dmg_strong)+(res*armor.defence*helm.defence)+hp_max)*spd;
		}
	}
}