/// @description spawn text
alarm[1]=300;
var _text=instance_create_depth(270,165,-y,obj_ui_spawntext);
with _text
{
	text="can you?";
	_color=c_red;
	time_in_sec=2;
	fadespeed=0.0012;
}
var _fade=instance_create(obj_fx_fadeout)
with _fade
{
	fade_speed=.002;
}