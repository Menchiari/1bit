/// @description start cinematic
layer_set_visible("Background", false);

instance_create_depth(0,0,0,obj_cin_boatrotate);
instance_create_layer(0,0,"Foreground",obj_cin_boatrotate_fg);