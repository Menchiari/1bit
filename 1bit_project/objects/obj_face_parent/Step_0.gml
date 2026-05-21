/// @description
object_set_sprite(0,sprite_index);
timer+=1;
var length = string_width(txt);
if (txt_progress < string_length(txt)) {txt_progress += txt_progress_spd;}//makes the text appear progressively

// one-time inits (safe if re-run)
if (!variable_instance_exists(id, "idle_grace")) idle_grace = 0;
if (!variable_instance_exists(id, "idle_grace_frames")) idle_grace_frames = max(1, round(game_get_speed(gamespeed_fps) * 0.10)); // ~100ms
if (!variable_instance_exists(id, "prev_state")) prev_state = state;

// auto-sync the question flag with the actual state (kills sticky question forever)
question = (state == "question");

/////////////////////////STATES//////////////////////////
switch (state)
{
    case "talk":
        image_speed = image_speed_default;

        if (timer >= length * txt_speed)
        {
            if (txt_auto) {
                image_index = 0;      // neutralize on line end
                blink_hold  = 0;
                txt_phase  += 1;
                timer       = 0;
                txt_progress = 0;
            } else {
                image_index = 0;
                blink_hold  = 0;
                state       = "idle";
                timer       = 0;
                idle_grace  = idle_grace_frames; // prevent instant skip in idle
            }
        }

        if ((mouse_check_button_released(mb_any) || global.action_released) && !question)
        {
            image_index  = 0;
            blink_hold   = 0;
            state        = "idle";
            timer        = 0;
            idle_grace   = idle_grace_frames;
            txt_progress = string_length(txt);
        }
    break;

    case "talk_intense":
        image_speed = image_speed_default; // same speed as talk

        // Hold last frame once reached (no loop), but DO NOT change sprite or frame count
        if (image_number > 0 && image_index >= image_number - 1) {
            image_index  = image_number - 1;
            image_speed  = 0; // freeze on the last subimage until the line ends
        }

        if (timer >= length * txt_speed)
        {
            if (txt_auto) {
                // advance to next line, reset face so idle isn't confusing if next state is idle
                image_index  = 0;
                blink_hold   = 0;
                txt_phase   += 1;
                timer        = 0;
                txt_progress = 0;
            } else {
                image_index  = 0;  // neutralize mouth before idle
                blink_hold   = 0;
                state        = "idle";
                timer        = 0;
                idle_grace   = idle_grace_frames;
            }
        }

        // NO SKIP in talk_intense (intentionally ignore mouse here)
    break;
	case "idle":
	    image_speed = 0;
	    idle_time   = idle_time_default;
	    blink_hold  = (blink_hold > 0) ? blink_hold - 1 : (irandom_range(0, 30) == 0 ? 5 : 0);
	    image_index = (blink_hold > 0);

	    if (idle_grace > 0) {
	        idle_grace -= 1; // eat the trailing click
	    } else if ((mouse_check_button_released(mb_any) || global.action_released) || timer >= idle_time) {
	        txt_phase   += 1;
	        state        = "talk";
	        timer        = 0;
	        txt_progress = 0;
	    }
	break;
	case "question":
	    // Animate like talk (same speed), then HOLD on last frame.
	    image_speed = image_speed_default;

	    // Once we reach the last subimage, freeze there (no looping, no blink override)
	    if (image_number > 0 && image_index >= image_number - 1) {
	        image_index = image_number - 1;
	        image_speed = 0;
	    }

	    // Click only REVEALS the text; advancing is handled by buttons elsewhere.
	    if ((mouse_check_button_released(mb_any) || global.action_released) && txt_progress < string_length(txt)) {
	        txt_progress = string_length(txt);
	        timer = 0;
	    }
		
		// --- GAMEPAD: navigate face_buttons by x-position ---
		// (buttons are recreated every frame by face_princess, so we track
		//  the focused X position, not an instance index)
		if (global.using_gamepad && instance_exists(obj_face_button))
		{
			// init focus x (-1 = unset)
			if (!variable_global_exists("face_btn_focus_x")) global.face_btn_focus_x = -1;
			
			// collect unique x positions
			var _positions = [];
			with (obj_face_button)
			{
				var _found = false;
				for (var _k = 0; _k < array_length(_positions); _k++)
				{ if (_positions[_k] == x) { _found = true; break; } }
				if (!_found) array_push(_positions, x);
			}
			array_sort(_positions, true); // left to right
			var _count = array_length(_positions);
			
			// if focus_x doesn't match any current button, default to leftmost
			var _cur = -1;
			for (var _k = 0; _k < _count; _k++)
			{ if (_positions[_k] == global.face_btn_focus_x) { _cur = _k; break; } }
			if (_cur == -1) { _cur = 0; global.face_btn_focus_x = _positions[0]; }
			
			// stick edge detection (stored on this face_parent instance)
			if (!variable_instance_exists(id, "_fb_rs_ph")) _fb_rs_ph = 0;
			if (!variable_instance_exists(id, "_fb_ls_ph")) _fb_ls_ph = 0;
			var _rh = gamepad_axis_value(0, gp_axisrh);
			var _lh = gamepad_axis_value(0, gp_axislh);
			var _rs_right = (_rh >  0.5 && _fb_rs_ph <=  0.5);
			var _rs_left  = (_rh < -0.5 && _fb_rs_ph >= -0.5);
			var _ls_right = (_lh >  0.5 && _fb_ls_ph <=  0.5);
			var _ls_left  = (_lh < -0.5 && _fb_ls_ph >= -0.5);
			_fb_rs_ph = _rh;
			_fb_ls_ph = _lh;
			
			// d-pad / sticks / keyboard
			if (_count > 1)
			{
				if (gamepad_button_check_pressed(0, gp_padr) || keyboard_check_pressed(vk_right) || _rs_right || _ls_right)
				{ _cur = (_cur + 1) % _count; }
				if (gamepad_button_check_pressed(0, gp_padl) || keyboard_check_pressed(vk_left) || _rs_left || _ls_left)
				{ _cur = (_cur - 1 + _count) % _count; }
				global.face_btn_focus_x = _positions[_cur];
			}
			
			// set selected on all buttons matching the focused x
			with (obj_face_button)
			{ selected = (x == global.face_btn_focus_x); }
		}
	break;
	case "wait":
		image_speed = 0;
		blink_hold = (blink_hold > 0) ? blink_hold - 1 : (irandom_range(0, 50) == 0 ? 5 : 0); //holds for 5 frames
		image_index = (blink_hold > 0);
		
		if (mouse_check_button_released(mb_any) || global.action_released)
		|| timer>=wait_time
		{
			txt_phase+=1;
			state="talk";
			timer=0;
			txt_progress=0;
		}
	break;
	default: break;
}

if (mouse_check_button_released(mb_any) || global.action_released) {show_debug_message("state = "+string(state)+", text phase = "+string(txt_phase)+", face progress = "+string(face_progress)+", game progress = "+string(game_progress));}

// If we just LEFT the question state, neutralize and add a tiny grace
if (prev_state == "question" && state != "question") {
    image_index = 0;
    blink_hold  = 0;
    idle_grace  = idle_grace_frames; // avoids accidental double-advance on the trailing click
}
prev_state = state;
