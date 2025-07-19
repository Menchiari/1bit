/// @description
//body
if instance_exists(obj_hero)
{
	scr_tracker_body(obj_hero.image_index);
	var body_offsetx=(tposx*obj_hero.dir*image_xscale)-((sprite_width/2)*obj_hero.dir*image_xscale);
	var body_offsety=(tposy*image_yscale)-(27*image_yscale);
	draw_sprite_ext(spr_torch,0,x+body_offsetx,y+body_offsety,(tscalex/5)*image_xscale*obj_hero.dir,(tscaley/6)*image_yscale,image_angle*trot,obj_hero.skin_color,1);
	draw_sprite_ext(spr_asset_bonfire,image_index,x+body_offsetx-(4*obj_hero.dir),y+body_offsety-5,(tscalex/5)*image_xscale*obj_hero.dir/2,(tscaley/6)*image_yscale/2,image_angle*trot*random_range(-10,10),c_white,1);
	draw_sprite_ext(spr_fx_light,0,x/*+body_offsetx-(4*obj_hero.dir)*/,y/*+body_offsety-5+random_range(-1,1)*/,1*obj_hero.dir,.9,random_range(-5,5),c_yellow,clamp((life+random_range(-.05,0)+.5),0,1));
}
