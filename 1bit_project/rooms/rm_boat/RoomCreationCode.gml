if instance_exists(obj_hero){obj_hero.state=states.idle;}
var layer_id = layer_get_id("nextroomLayer");
layer_set_is_drawn(layer_id, false);   // turns off drawing
layer_set_is_updated(layer_id, false); // turns off Step events (freezes logic)

//for reactivating layer check obj_cin_boatrotate_sideview