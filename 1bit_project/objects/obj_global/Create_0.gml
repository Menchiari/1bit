/////////////////////GLOBAL/////////////////////
init_enums();
init_globals();//scr_global();

depth=global.depth_ui;

window_set_cursor(cr_none);
display_mouse=false;
if os_type==os_windows
|| os_type==os_macosx
|| os_type==os_linux
{display_mouse=true}

// widescreen mode for PC
global.widescreen = (os_type != os_ios && os_type != os_android);
if (global.widescreen)
{
	global.sidepanel_sprite = spr_sidepanel_default;
	window_set_fullscreen(true);
}

////////////////////////SHADER////////////////////////////
/////////////disable application surface//////////////////
application_surface_draw_enable(false);
enable = true;
shader = global.shader;
iResolution = shader_get_uniform(shader,"iResolution");
iGlobalTime = shader_get_uniform(shader,"iGlobalTime");
palette = shader_get_uniform(shader,"palette");
gamma = shader_get_uniform(shader,"gamma");
flicker = shader_get_uniform(shader,"flicker");
time = 0;
p = 0;
g = global.gamma_default;
flk = 0;
flicker_amt = 0.025;
active_flicker = true;
x=0;
y=0;
res_x=global.res_x; //room_width;
res_y=global.res_y; //room_height;
global_xp=global.xp;
global_helms=global.helms;

//debug stuff

debug=true;
room_speed_type=0;
UI=true;