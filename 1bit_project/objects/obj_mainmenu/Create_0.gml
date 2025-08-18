/// obj_mainmenu : Create
text_string   = "BEGIN JOURNEY";
menu_font     = fnt_dialogue;
fade_speed    = 0.02;
text_y_ratio  = 0.71;
dim_on_press  = 0.40;
tap_anywhere  = true;

STATE_FADEIN  = 0;
STATE_WAIT    = 1;
STATE_FADEOUT = 2;

state       = STATE_FADEIN;
alpha_text  = 0;
bg_dim      = 0;
bg_dim_goal = 0;

col_text_idle        = c_white;
col_outline_idle     = c_black;
col_text_pressed     = c_black;
col_outline_pressed  = c_white;

// Fat gradient outline (alpha 'a' applies to both outline and fill)
draw_text_with_outline = function(xx, yy, str, inner_col, outline_col, a) {
	
var radii  = [10, 8, 6, 4, 2];  
var amults = [0.15, 0.30, 0.50, 0.70, 1.00];

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(outline_col);
    for (var r = 0; r < array_length(radii); r++) {
        var rad = radii[r];
        var al  = clamp(a * amults[r], 0, 1);
        draw_set_alpha(al);
        for (var i = 0; i < 8; i++) {
            var ang = i * 45;
            var dx = lengthdir_x(rad, ang);
            var dy = lengthdir_y(rad, ang);
            draw_text(xx + dx, yy + dy, str);
        }
    }

    draw_set_color(inner_col);
    draw_set_alpha(a);
    draw_text(xx, yy, str);

    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
};
