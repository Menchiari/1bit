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

// Center the full line so it stays centered during reveal
var full_w = string_width(line_text);
var center_x = vx + vw * 0.5;
var draw_x = center_x - full_w * 0.5;
var draw_y = vy + top_margin_px;

// Per-letter reveal blended with whole-line fade-out
var pen_x = draw_x;
for (var i = 1; i <= line_len; i++) {
    var ch = string_char_at(line_text, i);

    var start_i = (i - 1) * letter_gap_steps;
    var progress = (t_reveal - start_i) / letter_fade_steps;
    var a = clamp(progress, 0, 1) * line_alpha_mul;

    if (a > 0) {
        draw_set_alpha(a);

        // Draw black shadow around letter (pixel offsets)
        draw_set_color(c_black);
        draw_text(pen_x - 1, draw_y - 1, ch);
        draw_text(pen_x,     draw_y - 1, ch);
        draw_text(pen_x + 1, draw_y - 1, ch);
        draw_text(pen_x - 1, draw_y,     ch);
        draw_text(pen_x + 1, draw_y,     ch);
        draw_text(pen_x - 1, draw_y + 1, ch);
        draw_text(pen_x,     draw_y + 1, ch);
        draw_text(pen_x + 1, draw_y + 1, ch);

        // Main white letter
        draw_set_color(poem_color);
        draw_text(pen_x, draw_y, ch);
    }

    pen_x += string_width(ch);
}

// restore
draw_set_alpha(1);
draw_set_color(c_white);
