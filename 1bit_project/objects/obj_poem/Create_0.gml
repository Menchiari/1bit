/// obj_poem : Create

// ---------- Visual ----------
poem_font  = fnt_dialogue;
poem_color = c_white;
top_margin_px = 64;

// ---------- Timing ----------
frames_per_second = game_get_speed(gamespeed_fps);
sec_to_steps = function(seconds) {
    return max(1, round(seconds * frames_per_second));
};

letter_gap_steps   = sec_to_steps(0.10);
letter_fade_steps  = sec_to_steps(0.30);
line_pause_steps   = sec_to_steps(2.50);
line_fadeout_steps = sec_to_steps(2.50);

// ---------- Poem ----------
poem_lines = [
    "To conceive our greatest creation",
    "Was our one sided intention.",
    "Ever eager - our hunger unending",
    "Brought us to the near closing.",
    "The few left did nothing but mend",
    "The mistakes of the forgotten.",
    "Off we sail, follow the horizon",
    "To yet another inception."
];

// ---------- Playback state ----------
enum PState { reveal, pause, fadeout }
state = PState.reveal;

line_index = 0;
line_text  = poem_lines[line_index];
line_len   = string_length(line_text);

last_start_steps  = max(0, line_len - 1) * letter_gap_steps;
reveal_done_steps = last_start_steps + letter_fade_steps;

t_reveal = 0;
t_pause  = 0;
t_fade   = 0;
line_alpha_mul = 1;
