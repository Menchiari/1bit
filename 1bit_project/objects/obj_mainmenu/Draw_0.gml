/// obj_mainmenu : Draw
// 1) Draw your background sprite (origin 0,0)
draw_self();

// 2) Camera anchor
var cam = view_camera[0];
var vx  = camera_get_view_x(cam);
var vy  = camera_get_view_y(cam);
var vw  = camera_get_view_width(cam);
var vh  = camera_get_view_height(cam);

// 3) Dim overlay only while held (Step drives bg_dim)
if (bg_dim > 0.001) {
    draw_set_alpha(bg_dim);
    draw_set_color(c_black);
    draw_rectangle(vx, vy, vx + vw, vy + vh, false);
    draw_set_alpha(1);
}

// 4) Text pos (centered, lowered)
var tx = vx + vw * 0.5;
var ty = vy + vh * text_y_ratio;

// 5) Invert ONLY while held; after release it reverts while fading out
var down_now =
      mouse_check_button(mb_left)
   || device_mouse_check_button(0, mb_left)
   || keyboard_check(vk_anykey);

var invert = down_now; // not tied to fadeout state anymore

var col_fill    = invert ? col_text_pressed   : col_text_idle;
var col_outline = invert ? col_outline_pressed: col_outline_idle;

// 6) Draw text with thick gradient outline; both fade via alpha_text
draw_set_font(menu_font);
draw_text_with_outline(tx, ty, text_string, col_fill, col_outline, alpha_text);


// --- HARD RESET RENDER STATE AFTER WE DRAW ---
draw_set_color(c_white);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal); // if you never changed it, still safe to reset