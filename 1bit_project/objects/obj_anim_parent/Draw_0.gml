/// @description Draw character
draw_sprite(sprite_index,image_index,x,y);
draw_sprite_shadow(spr_hero,image_index,x,y,dir*image_xscale,1*image_yscale,skin_color,0,0,.5,1);
//body
scr_tracker_body(image_index);
var body_offsetx=(tposx*dir*image_xscale)-((sprite_width/2)*dir*image_xscale);
var body_offsety=(tposy*image_yscale)-(27*image_yscale);
draw_sprite_ext(sprite_body,0,x+body_offsetx,y+body_offsety,(tscalex/5)*image_xscale*dir,(tscaley/6)*image_yscale,image_angle*trot,skin_color,1);
//head
scr_tracker(image_index);
var offsetx=(tposx*dir*image_xscale)-((sprite_width/2)*dir*image_xscale);
var offsety=(tposy*image_yscale)-(27*image_yscale);
draw_sprite_shadow(sprite_head,0,x+offsetx,y+offsety,(tscalex/3)*dir,(tscaley/3),skin_color,0,0,1,1);
//rimlight
draw_sprite_ext(sprite_back,image_index,x+.5,y+.5,dir*image_xscale,1*image_yscale,image_angle,c_black,.1);
