room_goto(nextroom);
once=true;
if instance_exists(obj_fx_fadeout)
{
	instance_destroy(obj_fx_fadeout);
}
scr_savegame();