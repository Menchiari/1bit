//movement
if instance_exists(obj_hero)
{
	if point_distance(x,y,obj_hero.x,obj_hero.y)<global.res_y*1.5 {active=true;}
	else {active=false;}
	//charisma
	if dialogue_variation==true
	{
		if obj_hero.charisma-charisma<=-1 {speech_text=dialogue_negative;}
		else if obj_hero.charisma-charisma>=1 {speech_text=dialogue_positive;}
		else {speech_text=dialogue_neutral;}
	}
}

if active==true
{
//main code
	instance_activate_object(self);
	depth=-y;
	scr_controls();
	scr_state_machine();
	scr_collisions();
}
else
{
	instance_deactivate_object(self);
}
//char_rot=round((device_get_tilt_x()*90)/10)*10;

//reflection
//if instance_exists(reflection)
//{
//	reflection.image_index=image_index;
//	reflection.x=x;
//	reflection.y=y;
//	reflection.back=back;
//	reflection.dir=dir;
//	reflection.sprite_skin=sprite_skin;
//	reflection.sprite_body=sprite_body;
//	reflection.helm.sprite=helm.sprite;
//	reflection.sprite_back=sprite_back;
//}