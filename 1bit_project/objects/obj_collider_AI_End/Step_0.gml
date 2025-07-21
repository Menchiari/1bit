/// @description
if place_meeting(x,y,obj_hero) && once==true
{
	once=false;
	obj_hero.control=controls.null;
	obj_hero.state=states.run;
	obj_hero.dest_x=270;
	obj_hero.dest_y=350;
	//with obj_hero {scr_character_move(270,400,run_sp,3);}
	alarm[0]=50;
}