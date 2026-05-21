///@description Shader effect

draw_clear_alpha(c_black, 1);

// section detection for rm_world
if (room == rm_world && instance_exists(obj_camera))
{
    // Zone grid: 11 columns × 6 rows (180px × 320px per cell)
    // Edit values here — left to right, top to bottom. 0 = default.
    var _grid = [
        [0, 0, 6, 6, 6, 5, 5, 5, 5, 5, 5],  // Row 1
        [0, 0, 6, 0, 5, 5, 5, 5, 5, 5, 5],  // Row 2
        [7, 7, 7, 7, 5, 5, 1, 1, 4, 4,10],  // Row 3
        [7, 7, 7, 1, 1, 1, 1, 8, 4, 4, 3],  // Row 4
        [9, 8, 8, 1, 1, 8, 2, 8, 4, 4, 3],  // Row 5
        [2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3],  // Row 6
    ];

    var _col = clamp(floor(obj_camera.x / 180), 0, 10);
    var _row = clamp(floor(obj_camera.y / 320), 0, 5);
    var _zone = _grid[_row][_col];

    switch (_zone)
    {
        case 1:  global.sidepanel_sprite = spr_sidepanel_1;  break;
        case 2:  global.sidepanel_sprite = spr_sidepanel_2;  break;
        case 3:  global.sidepanel_sprite = spr_sidepanel_3;  break;
        case 4:  global.sidepanel_sprite = spr_sidepanel_4;  break;
        case 5:  global.sidepanel_sprite = spr_sidepanel_5;  break;
        case 6:  global.sidepanel_sprite = spr_sidepanel_6;  break;
        case 7:  global.sidepanel_sprite = spr_sidepanel_7;  break;
        case 8:  global.sidepanel_sprite = spr_sidepanel_8;  break;
        case 9:  global.sidepanel_sprite = spr_sidepanel_9;  break;
        case 10: global.sidepanel_sprite = spr_sidepanel_10; break;
        default: global.sidepanel_sprite = spr_sidepanel_default; break;
    }
}
else
{
    if room == rm_faces_ai {global.sidepanel_sprite=spr_sidepanel_11;}
    
    else if room == rm_story_1 {global.sidepanel_sprite=spr_sidepanel_2;}
    else if room == rm_story_1_stairs {global.sidepanel_sprite=spr_sidepanel_10;}
    else if room == rm_story_1b {global.sidepanel_sprite=spr_sidepanel_2;}
    else if room == rm_story_2 || room==rm_cinematic_cave {global.sidepanel_sprite=spr_sidepanel_10;}
    else if room == rm_story_AI {global.sidepanel_sprite=spr_sidepanel_11;}
    else if room == rm_story_AI_2 {global.sidepanel_sprite=spr_sidepanel_11;}
    else if room == rm_story_caves {global.sidepanel_sprite=spr_sidepanel_7;}
    else if room == rm_story_princess_fight {global.sidepanel_sprite=spr_sidepanel_6;}
    else if room == rm_story_princess_raid {global.sidepanel_sprite=spr_sidepanel_6;}
    
    else if room == rm_faces_default {global.sidepanel_sprite=spr_sidepanel_1;}
    else if room == rm_faces_princess {global.sidepanel_sprite=spr_sidepanel_6;}
    else if room==rm_faces_boat || room==rm_boat {global.sidepanel_sprite=spr_sidepanel_9;}
    else if room==rm_faces_boss_death || room==rm_faces_boss_intro || room==rm_boss {global.sidepanel_sprite=spr_sidepanel_10;}

    else if room==rm_death || room==rm_faces_death || room==rm_gameover || room==rm_glitch || room==rm_cinematic_intro {global.sidepanel_sprite=spr_null;}

    else {global.sidepanel_sprite = spr_sidepanel_default;}
}

if (global.widescreen)
{
    var _dw = display_get_width();
    var _dh = display_get_height();
    var _scale = floor(_dh / 320);
    if (_scale < 1) _scale = 1;
    var _game_w = res_x * _scale;
    var _game_h = res_y * _scale;
    var _game_x = floor((_dw - _game_w) / 2);
    var _game_y = floor((_dh - _game_h) / 2);

    // build panel surface: sprite + fade drawn raw (no shader yet)
    var _spw = sprite_get_width(global.sidepanel_sprite);
    var _sph = sprite_get_height(global.sidepanel_sprite);
    if (!surface_exists(global._panel_surf))
        global._panel_surf = surface_create(_spw, _sph);

    surface_set_target(global._panel_surf);
    draw_clear_alpha(c_black, 1);
    draw_sprite(global.sidepanel_sprite, 0, 0, 0);
    var _fade_alpha = 0;
    if (instance_exists(obj_fx_fadein)) _fade_alpha = obj_fx_fadein.alpha;
    if (instance_exists(obj_fx_fadeout)) _fade_alpha = obj_fx_fadeout.alpha;
    if (_fade_alpha > 0)
    {
        draw_set_alpha(_fade_alpha);
        draw_rectangle_color(0, 0, _spw, _sph, 0, 0, 0, 0, false);
        draw_set_alpha(1);
    }
    surface_reset_target();

    // now set GUI size and shader
    display_set_gui_size(_dw, _dh);
    if enable
    {
        shader_set(shader);
        shader_set_uniform_f(iResolution, res_x, res_y);
        shader_set_uniform_f(iGlobalTime, time);
        shader_set_uniform_f(palette, p);
        shader_set_uniform_f(gamma, g);
        shader_set_uniform_f(flicker, flk);
    }

    // panels through shader (fade already baked into surface as gray values)
    draw_surface_ext(global._panel_surf, _game_x, _game_y, -_scale, _scale, 0, c_white, 1);
    draw_surface_ext(global._panel_surf, _game_x + _game_w, _game_y, _scale, _scale, 0, c_white, 1);

    // gameplay through shader (fade already baked by fade objects)
    // NOTE: both branches are now identical — no surface_resize here.
    // Other_4 already set the surface to widescreen dimensions on room start.
    // Resizing it here was destroying the layout every frame for no-camera rooms.
    var _surf_w = surface_get_width(application_surface);
    var _crop_x = floor((_surf_w - res_x) / 2);
    draw_surface_part_ext(application_surface, _crop_x, 0, res_x, res_y, _game_x, _game_y, _scale, _scale, c_white, 1);

    shader_reset();
}
else
{
    if enable
    {
        shader_set(shader);
        shader_set_uniform_f(iResolution, res_x, res_y);
        shader_set_uniform_f(iGlobalTime, time);
        shader_set_uniform_f(palette, p);
        shader_set_uniform_f(gamma, g);
        shader_set_uniform_f(flicker, flk);
    }

    if instance_exists(obj_camera)
    {
        draw_surface_stretched(application_surface, 0, 0, res_x, res_y);
        display_set_gui_size(res_x, res_y);
    }
    else
    {
        surface_resize(application_surface, room_width, room_height);
        draw_surface_stretched(application_surface, 0, 0, res_x, res_y);
        display_set_gui_size(res_x, res_y);
    }

    shader_reset();
}