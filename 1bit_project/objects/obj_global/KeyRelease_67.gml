/// @description SHOW COORDINATES
show_debug_message("Story progress = "+string(global.story_progress));
show_debug_message("Total deaths = "+string(global.deathcount));
if instance_exists(obj_camera) {show_debug_message("camera: "+string(obj_camera.x)+","+string(obj_camera.y));}
if instance_exists(obj_hero) {show_debug_message("hero: "+string(obj_hero.x)+","+string(obj_hero.y));}
if instance_exists(obj_player_spawn) {show_debug_message("spawn: "+string(obj_player_spawn.x)+","+string(obj_player_spawn.y));}