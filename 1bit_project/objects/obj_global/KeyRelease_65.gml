/// @description Select map +ctrl
if keyboard_check(vk_control) room_goto(rm_menu_character);
else room_goto(choose(rm_dng1,rm_dng2,rm_dng3,rm_dng4,rm_dng5,rm_dng6,rm_dng7,rm_dng8,rm_dng9));