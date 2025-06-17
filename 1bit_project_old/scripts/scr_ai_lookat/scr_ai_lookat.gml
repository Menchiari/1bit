// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_lookat(_x,_y,_character){
	if _x>x {_character.dir=1;}
	if _x<x {_character.dir=-1;}
	if _y>y {_character.back=false;}
	if _y<y {_character.back=true;}
}