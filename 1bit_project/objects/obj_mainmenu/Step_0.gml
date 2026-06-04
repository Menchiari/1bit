/// obj_mainmenu : Step

// gamepad slot alias (set by scr_input_update each frame)
var _gp = variable_global_exists("gamepad_slot") ? global.gamepad_slot : 0;

var down_now =
      mouse_check_button(mb_left)
   || device_mouse_check_button(0, mb_left)
   || keyboard_check(vk_anykey);

var pressed_now =
      mouse_check_button_pressed(mb_left)
   || device_mouse_check_button_pressed(0, mb_left)
   || keyboard_check_pressed(vk_anykey);

// track whether a gamepad button was pressed in this room
if (!variable_instance_exists(id, "_gp_ready")) _gp_ready = false;
if (_gp >= 0 && (gamepad_button_check_pressed(_gp, gp_face1) || gamepad_button_check_pressed(_gp, gp_face2)
|| gamepad_button_check_pressed(_gp, gp_start)))
{ _gp_ready = true; }

var released_now =
      mouse_check_button_released(mb_left)
   || device_mouse_check_button_released(0, mb_left)
   || keyboard_check_released(vk_anykey)
   || (_gp_ready && _gp >= 0 && (gamepad_button_check_released(_gp, gp_face1)
   || gamepad_button_check_released(_gp, gp_face2)
   || gamepad_button_check_released(_gp, gp_start)));

switch (state) {
    case STATE_FADEIN:
        alpha_text = clamp(alpha_text + fade_speed, 0, 1);
        if (alpha_text >= 1) state = STATE_WAIT;
    break;

    case STATE_WAIT:
        // While held: darken and invert (handled in Draw); on release: revert and start fadeout
        bg_dim_goal = down_now ? dim_on_press : 0;
        if (tap_anywhere && released_now) {
            // revert background immediately after release
            bg_dim_goal = 0;
            state = STATE_FADEOUT;
        }
    break;

    case STATE_FADEOUT:
        // fade both text and outline (outline uses same alpha via 'a')
        alpha_text = clamp(alpha_text - fade_speed, 0, 1);
        // keep background light during fadeout (no dim)
        bg_dim_goal = 0;
        if (alpha_text <= 0) room_goto(rm_faces_default);
    break;
}

// smooth background dim
bg_dim = lerp(bg_dim, bg_dim_goal, 0.25);
