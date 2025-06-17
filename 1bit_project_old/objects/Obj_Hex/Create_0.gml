/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

flat_top = false;

radius = 40//not working
for (var i = 0; i < 6; i+=1){
walls[i] = 1;	
}
axial = new map_axial(0,0);

theme = 0;
overlapping = false;
overlapping_theme = 0;

visited = false;
HexWallRemix = false;
GenOver = false;

populated = false;

HexColor = merge_color(c_black,c_white,random_range(0,1))// c_gray;
LineWidth = 4;
LineColor = c_lime;

wall_collider = false;

//temp
sprite=spr_hex_test_bg//choose(spr_hex_test_bg,spr_bg_hex_ruins_bg,spr_bg_hex_ruins2_bg,spr_bg_hex_forest2_bg,spr_bg_hex_forest3_bg);
color=c_white;//merge_color(c_black,c_white,random_range(0.75,1))
alpha=random_range(.85,1);
alarm[0]=2;

x=round(x);
y=round(y);