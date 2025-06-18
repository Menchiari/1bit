// Inherit the parent event
event_inherited();

global.deathcount+=1;

instance_create(obj_fx_screenshake);
instance_create(obj_death);

object_set_persistent(object_index,false);