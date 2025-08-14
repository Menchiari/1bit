/// @description setup
camspeed=.6;
camdistance=500;
oncerot=true;

if instance_exists(obj_hero) {
	audio_play_sound_at(snd_music_beach,obj_hero.x,obj_hero.y,0,100,500,1,false,2,global.audio_music*.6,0,1);
}
instance_create_depth(x,y,global.depth_ui_front,obj_poem);