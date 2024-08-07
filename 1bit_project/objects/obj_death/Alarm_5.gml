/// @description restart
//if global.deathcount==1 {room_goto(rm_death);}
if room!=rm_death {room_goto(rm_death);}
else {room_goto(rm_menu_character);}