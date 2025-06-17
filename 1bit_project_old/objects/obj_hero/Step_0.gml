/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if state!=states.spawn {speech_visible=false;}
else {speech_visible=true;}


//gamepad
if gamepad_axis_value(0,gp_axislh)>0 || gamepad_axis_value(0,gp_axislv)>0
{
	dest_x=gamepad_axis_value(0,gp_axislh)*walk_sp*10;
	dest_y=gamepad_axis_value(0,gp_axislv)*walk_sp*10;
}