ini_open("save.sav")
open=ini_read_real("DEBUG","DOOR"+string(id),0)
ini_close();
depth=-y;

if instance_exists(obj_collider)
{
	//destroy_door=instance_nearest(x,y,obj_collider);
	destroy_door=instance_place(x,y,obj_collider_door)
	
}
