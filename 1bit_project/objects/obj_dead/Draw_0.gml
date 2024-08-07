draw_sprite_ext(sprite_index,image_index,x,y,dir*size,1*size,char_rot,main_color,1);

//draw effects under character
draw_sprite_ext(sprite_skin,image_index,x,y,dir*size,-1*size,char_rot,skin_color,.15);//reflection
draw_sprite_ext(sprite_shadow,image_index,x,y,.5*dir*size,.25*size,char_rot,c_white,.5);//shadow

//draw character
draw_sprite_shadow(sprite_skin,image_index,x,y,dir*size,1*size,skin_color,0,0,2,2);

scr_tracker_body(image_index);
var body_offsetx=(tposx*dir*size)-((sprite_width/2)*dir*size);
var body_offsety=(tposy*size)-(27*size);
if sprite_body==character_body{draw_sprite_ext(sprite_body,0,x+body_offsetx,y+body_offsety,(tscalex/5)*size*dir,(tscaley/6)*size,trot*char_rot,skin_color,1);}
else {draw_sprite_ext(sprite_body,0,x+body_offsetx,y+body_offsety,(tscalex/5)*size*dir,(tscaley/6)*size,trot*char_rot,main_color,1);}

scr_tracker(image_index);
var offsetx=(tposx*dir*size)-((sprite_width/2)*dir*size);
var offsety=(tposy*size)-(27*size);
if helm.sprite==character_head{draw_sprite_shadow(helm.sprite,0,x+offsetx,y+offsety,(tscalex/3)*dir,(tscaley/3),skin_color,0,0,1,1);}
else {draw_sprite_shadow(helm.sprite,0,x+offsetx,y+offsety,(tscalex/3)*dir,(tscaley/3),main_color,0,0,1,1);}
