/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
alarm[0]=5;
voice_pitch_hired=1;

mercenary=instance_nearest(x,y,obj_mercenary)//collision_circle(x,y,10,obj_character,true,true);
if instance_exists(mercenary)
{
	x=mercenary.x;
	y=mercenary.y-7;
	xoriginal=mercenary.x;
	yoriginal=mercenary.y-7;
	voice_pitch_hired=mercenary.mercenary_voice_pitch;
}