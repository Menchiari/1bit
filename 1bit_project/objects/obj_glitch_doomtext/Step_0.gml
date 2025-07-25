/// @description

// Inherit the parent event
//event_inherited();

var length = string_width(txt);
if (txt_progress < string_length(txt)+100) {txt_progress += txt_progress_spd;}
else
{
	if once==true
	{
		once=false;
		alarm[0]=1;
	}
}