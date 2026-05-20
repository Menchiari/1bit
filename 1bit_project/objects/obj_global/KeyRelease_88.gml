/// @description kill player
if global.debug==true
{

global.xp +=5;
if instance_exists(obj_hero) instance_destroy(obj_hero);

}