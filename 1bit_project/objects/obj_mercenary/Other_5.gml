/// @description save variables
if (ai_state == ai_states.follow) {
    var data = {
		obj: object_index,
		character_head: character_head,
		name: name,
		weapon: weapon,
		armor: armor,
		helm: helm,
		hp: hp,
		str: str,
		res: res,
        skin_color: skin_color,
        speech_color: speech_color
    };

    array_push(global.followers, data);
	show_debug_message(string(self.name)+" saved in global.followers data")
}
