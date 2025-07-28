var _posx=x+(sprite_width*image_xscale)*.5;
var _posy=y+(sprite_height*image_yscale)*.5;
var _radius=sprite_width*image_xscale*5;
var _range=sprite_height*image_yscale*.5;
audio_play_sound_at(sound_to_play,_posx,_posy,0,_radius,_range,volume_var,loops,10,1,0,1);
show_debug_message("playing "+string(sound_to_play)+" at x:"+string(_posx)+" y:"+string(_posy)+" with radius "+string(_radius)+" and range "+string(_range))
//instance_destroy();