scr_init_character();

sprite_index=spr_hero;

main_color=c_white;
color_a=c_white;
color_b=c_red;
var chance=choose(0,1)
if chance==1
{
	color_a=c_red;
	color_b=c_white;
}

sprite_skin=spr_hero;
sprite_body=spr_null;
helm.sprite=spr_null;
sprite_shadow=spr_shadow;

death_1_a=66;
death_1_b=76;
death_2_a=77;
death_2_b=86;
death_3_a=86;
death_3_b=105;
death_a=0;
death_b=0;

dir=choose(-1,1);
char_rot=global.orientation+(random_range(-30,30));
size=1;

death_choice=choose(1,2,3);
//death_power=0;

alarm[0]=1;
dead=false;