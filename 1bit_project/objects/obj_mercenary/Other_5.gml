if (ai_state == ai_states.follow) && instance_exists(obj_hero) {
    var data = {
		obj: object_index,
		character_head_var: character_head_var,
		name_var: name_var,
		weapon_var: weapon_var,
		armor_var: armor_var,
		helm_var: helm_var,
		hp_var: hp_var,
		str_var: str_var,
		res_var: res_var,
        color_var: color_var,
        speech_color_var: speech_color_var
    };

    array_push(global.followers, data);
	show_debug_message(string(self.name)+" saved in global.followers data")
}