/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

//draw points
if flat_top = true {
	var perimeter = flat_hex_perimeter(radius);
	for (var i=0;i<6;i+=1){
		draw_point(perimeter[i].xx,perimeter[i].yy);
	}
}
else {
	var perimeter = pointy_hex_perimeter(radius);
	for (var i=0;i<6;i+=1){
		draw_point(perimeter[i].xx,perimeter[i].yy);
	}
}

//HexColor = c_black
//if visited {HexColor = c_black};
//if GenOver {HexColor = c_black};
//if global.labyrinth_generated = true{
//var test_color = noise(axial.q,axial.r,0);
////print(string(id)+"' n:"+string(test_color));
//test_color = test_color*255;
//HexColor = make_color_rgb(test_color,test_color,test_color)
//}

//draw hex color
var _steps = 6;
var _xx = x;
var _yy = y;
var _radius = radius;
//draw_set_color(HexColor);
draw_primitive_begin(pr_trianglefan);
draw_vertex_color(_xx, _yy,HexColor,1);
for(var i = 0; i < _steps; ++i;)
{
	//draw_vertex(_xx + lengthdir_x(_radius, 360 * i / _steps), _yy + lengthdir_y(_radius, 360 * i / _steps));
	draw_vertex_color(perimeter[i].xx,perimeter[i].yy,HexColor,1)
}
draw_vertex_color(perimeter[0].xx,perimeter[0].yy,HexColor,1);
draw_primitive_end();


var this_r = axial.r; var this_q = axial.q;
//draw_text(x,y,"r:"+string(this_r)+"q:"+string(this_q))
var old_color = draw_get_color();
draw_set_color(c_red);
//draw walls in a very dreadfull way
 if walls[5] =1 {
	draw_line_width(perimeter[0].xx , perimeter[0].yy, perimeter[1].xx , perimeter[1].yy, global.LineWidth);
	}
if walls[4] =1 {
	draw_line_width(perimeter[1].xx , perimeter[1].yy, perimeter[2].xx , perimeter[2].yy, global.LineWidth);
	}
if walls[3] =1 {
	draw_line_width(perimeter[2].xx , perimeter[2].yy, perimeter[3].xx , perimeter[3].yy, global.LineWidth);
	}
if walls[2] =1 {
	draw_line_width(perimeter[3].xx , perimeter[3].yy, perimeter[4].xx , perimeter[4].yy, global.LineWidth);
	}
if walls[1] =1 {
	draw_line_width(perimeter[4].xx , perimeter[4].yy, perimeter[5].xx , perimeter[5].yy, global.LineWidth);
	}
if walls[0] =1 {
	draw_line_width (perimeter[5].xx , perimeter[5].yy, perimeter[0].xx , perimeter[0].yy, global.LineWidth);
	}
draw_set_color(old_color)

draw_sprite_ext(sprite,0,x,y,1,1,0,color,alpha);