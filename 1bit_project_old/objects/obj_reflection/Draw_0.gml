depth=-y;

draw_sprite_shadow(sprite_skin,image_index,x,y,dir,1,main_color,0,0,2,2);
draw_sprite_shadow(sprite_body,image_index,x,y,dir,1,main_color,0,0,.5,2);
draw_sprite_shadow(helm.sprite,image_index,x,y,dir,1,main_color,0,-1,.5,2);


scr_tracker_body(image_index);
var body_offsetx=(tposx*dir*size)-((sprite_width/2)*dir*size);
var body_offsety=(tposy*size)-(27*size);
draw_sprite_ext(sprite_body,0,x+body_offsetx,y+body_offsety,(tscalex/5)*size*dir,(tscaley/6)*size,trot*char_rot,main_color,1);
scr_tracker(image_index);
var offsetx=(tposx*dir*size)-((sprite_width/2)*dir*size);
var offsety=(tposy*size)-(27*size);
draw_sprite_shadow(helm.sprite,0,x+offsetx,y+offsety,(tscalex/3)*dir,(tscaley/3),main_color,0,0,1,1);


if back==false
{
	draw_sprite_ext(sprite_back,image_index,x,y,dir,-1,char_rot,c_white,1);
}