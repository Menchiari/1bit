/// @description setup
camspeed=.5;
camdistance=500;
oncerot=true;

if instance_exists(obj_hero) {
	audio_play_sound_at(snd_music_beach,obj_hero.x,obj_hero.y,0,100,500,1,true,2,global.audio_music*.75,0,1);
}