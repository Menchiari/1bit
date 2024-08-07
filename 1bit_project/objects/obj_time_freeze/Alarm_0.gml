if instance_number(obj_time_freeze)>max_amount {instance_destroy();}
else
{
	room_speed=room_speed*room_speed_modifier;
	alarm[1]=room_speed_reset_time;
}