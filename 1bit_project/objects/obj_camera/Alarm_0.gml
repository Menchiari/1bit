/// @description immediately reactivate obj_hero to keep it safe
if instance_exists(obj_hero)
instance_activate_object(obj_hero);
alarm[0]=irandom_range(10,20);