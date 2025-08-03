if only_once==true
{
	if place_meeting(x,y,obj_hero) && once==true
	{
		path_end();
		obj_hero.x=destination_x;
		obj_hero.y=destination_y;
		obj_hero.dest_x=destination_x;
		obj_hero.dest_y=destination_y;
		once=false;
		if fader==true
		{
			instance_create(obj_fx_fadein_fast);
		}
	}
}
else
{
	var character = instance_place(x, y, obj_character);

	if (character != noone) {
	    path_end();
	    character.x = destination_x;
	    character.y = destination_y;
	    character.dest_x = destination_x;
	    character.dest_y = destination_y;
	}

}