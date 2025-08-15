/// @description
if image_index>=lastframe
|| global.introcinematic==false
{room_goto(nextroom);}

// frames where we check sync
if (image_index == 1 || image_index == 65 || image_index == 116 || image_index == 204) {
    var pos = audio_sound_get_track_position(snd_cinematic_intro_music);
    var target_pos = image_index / 10; // 10fps → seconds

    // only correct if drift > 50ms
    if (abs(pos - target_pos) > 0.05) {
        audio_sound_set_track_position(snd_cinematic_intro_music, target_pos);
    }
}