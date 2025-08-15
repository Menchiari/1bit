/// obj_poem : Draw End

// Camera anchoring (view 0)
var cam = view_camera[0];
var vx  = camera_get_view_x(cam);
var vy  = camera_get_view_y(cam);
var vw  = camera_get_view_width(cam);

// Setup draw state
draw_set_font(poem_font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var lines = string_split(line_text, "\n");
var center_x = vx + vw * 0.5;
var draw_y = vy + top_margin_px;

for (var l = 0; l < array_length(lines); l++) {
    var line = lines[l];
    var line_w = string_width(line);
    var draw_x = center_x - (line_w * 0.5);
    var pen_x = draw_x;

    for (var i = 1; i <= string_length(line); i++) {
        var ch = string_char_at(line, i);

        var char_index = 0;
        for (var prev_l = 0; prev_l < l; prev_l++) {
            char_index += string_length(lines[prev_l]);
        }
        char_index += i;

        var start_i = (char_index - 1) * letter_gap_steps;
        var progress = (t_reveal - start_i) / letter_fade_steps;
        var a = clamp(progress, 0, 1) * line_alpha_mul;

        if (a > 0) {
            draw_set_alpha(a);

            // Shadow (8-way)
            draw_set_color(c_black);
            for (var ox = -1; ox <= 1; ox++) {
                for (var oy = -1; oy <= 1; oy++) {
                    if (ox != 0 || oy != 0) {
                        draw_text(pen_x + ox, draw_y + oy, ch);
                    }
                }
            }

            // Main letter
            draw_set_color(poem_color);
            draw_text(pen_x, draw_y, ch);
        }

        pen_x += string_width(ch);
    }

    draw_y += string_height(line); // Move down for next line
}

// Restore
draw_set_alpha(1);
draw_set_color(c_white);
