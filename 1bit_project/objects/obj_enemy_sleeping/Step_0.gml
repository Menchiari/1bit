/// @description 

// Inherit the parent event
event_inherited();

if state==states.spawn
{speech_text="zzz...";}
else
{
	if awake==false
	{
		speech_text="!";
		awake=true;
	}
}