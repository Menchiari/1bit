// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_nextroom_gen(){
	var allrooms=global.allrooms;
	var return_room=global.chosen_room;

	if allrooms==true
	{
		if !ds_list_empty(global.room_list)	{ds_list_shuffle(global.room_list);}
		if ds_list_size(global.room_list)>0
		{
			global.chosen_room=ds_list_find_value(global.room_list,0);
			return_room=global.chosen_room;
			ds_list_delete(global.room_list,0);
		}
		else
		{
			scr_restart();
		}
	}

	else
	{
		ds_list_shuffle(global.room_list_a);
		ds_list_shuffle(global.room_list_b);
		ds_list_shuffle(global.room_list_c);
		
		if ds_list_size(global.room_list_a)>0
		{
			global.chosen_room=ds_list_find_value(global.room_list_a,0);
			return_room=global.chosen_room;
			ds_list_delete(global.room_list_a,0);
		}
		else
		{
			if ds_list_size(global.room_list_b)>0
			{
				global.chosen_room=ds_list_find_value(global.room_list_b,0);
				return_room=global.chosen_room;
				ds_list_delete(global.room_list_b,0);
			}
			else
			{
				if ds_list_size(global.room_list_c)>0
				{
					global.chosen_room=ds_list_find_value(global.room_list_c,0);
					return_room=global.chosen_room;
					ds_list_delete(global.room_list_c,0);
				}
				else {scr_restart();}
			}
		}
	}
	return return_room;
}