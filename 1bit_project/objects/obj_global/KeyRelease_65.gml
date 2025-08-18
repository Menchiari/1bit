/// @description Select map +ctrl
if keyboard_check(vk_control) {room_goto(rm_menu_character);}
else if keyboard_check(vk_shift) {room_goto(rm_world);}
else if keyboard_check(vk_alt) {room_goto(rm_story_1b);}
else {room_goto(rm_death);}