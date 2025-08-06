/// @description restart
//What a complicate way to choose a post-death room!
if global.deathcount==1
&& room==rm_story_caves
{
	var _wpn=0;
	var _arm=0;
	var _hlm=0;
	global.story_progress=1;
	global.player_weapon=global.weapons[_wpn];
	global.player_armor=global.armors[_arm];
	global.player_helm=global.helms[_hlm];
	scr_savegame();
	room_goto(rm_cinematic_intro);
}
else
{
	if room!=rm_death {room_goto(rm_death);}
	else {room_goto(rm_menu_character);}
}