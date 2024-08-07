/// @description 
scr_init_character();
image_speed=0;
chess_piece=choose("pawn","knight");
current_state="wait";
sq_w=18.2;
sq_h=17.5;
attack=false;
radius=abs(sq_w-sq_h)+3;
atk_speed=10;
damage=5;
faction=factions.neutral;
target_always=obj_character;
target_attack=obj_character;
var variation=choose(sq_w,sq_w*2)*choose(1,-1);
x=choose(x,x+variation)+((sq_w/2)*choose(1,-1));
var variation=sq_h*choose(1,-1);
y=y//choose(y,y+sq_h);

if instance_exists(obj_chesspiece)
{
	if obj_chesspiece.chess_piece="knight" chess_piece="pawn";
}

dest_x=x;
dest_y=y;