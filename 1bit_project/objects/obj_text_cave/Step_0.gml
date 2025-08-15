/// obj_poem : Step

switch (state) {
    case PState1.reveal1:
        t_reveal++;
        if (t_reveal >= reveal_done_steps) {
            state = PState1.pause1;
            t_pause = 0;
            line_alpha_mul = 1;
        }
    break;

    case PState1.pause1:
        t_pause++;
        if (t_pause >= line_pause_steps) {
            state = PState1.fadeout1;
            t_fade = 0;
        }
    break;

    case PState1.fadeout1:
        t_fade++;
        line_alpha_mul = 1 - (t_fade / line_fadeout_steps);
        if (line_alpha_mul <= 0) {
            line_index++;
            if (line_index >= array_length(poem_lines)) {
                instance_destroy();
                exit;
            }
            // next line
            line_text = poem_lines[line_index];
            line_len  = string_length(line_text);

            last_start_steps  = max(0, line_len - 1) * letter_gap_steps;
            reveal_done_steps = last_start_steps + letter_fade_steps;

            t_reveal = 0;
            t_pause  = 0;
            t_fade   = 0;
            line_alpha_mul = 1;
            state = PState1.reveal1;
        }
    break;
}
