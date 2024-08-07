/// @description kill player
global.xp +=5;
if instance_exists(obj_hero) instance_destroy(obj_hero);
