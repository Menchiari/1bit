/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_hero)
{
	if instance_place(obj_hero.x,obj_hero.y,self) && instance_place(mouse_x,mouse_y,self)
	{
		obj_hero.dest_y+=up+dwn;
		obj_hero.dest_x+=west+east;
		obj_hero.state=states.run;
	}
}
