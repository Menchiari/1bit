/// @description Select map +ctrl
if keyboard_check(vk_control) room_goto(rm_menu_character);
else if keyboard_check(vk_alt) room_goto(rm_dng1);
else room_goto(rm_death);