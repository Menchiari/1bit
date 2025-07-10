/// @description check door
if autobreak==true
{
	if collision_circle(x,y,autobreak_range,obj_enemy,false,true){}
	else {state=states.death;}
}
alarm[1]=irandom_range(5,15);