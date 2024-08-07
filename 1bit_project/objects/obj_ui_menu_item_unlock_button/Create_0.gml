//event_inherited();

lineax1=random_range(0,sprite_width);
lineax2=random_range(0,sprite_width);
linebx1=random_range(0,sprite_width);
linebx2=random_range(0,sprite_width);
linecx1=random_range(0,sprite_width);
linecx2=random_range(0,sprite_width);
selected=false;

text="";
size=3;
posx=16;
posy=12;
color=c_white;
alpha=1;
font=fnt_dialogue;

original_item_weapon=0;
original_item_armor=0;
original_item_helm=0;
original_item=0;

if instance_exists(obj_hero)
{
	original_item_weapon=global.player_weapon;
	original_item_armor=global.player_armor;
	original_item_helm=global.player_helm;
}

type=0;//0 is equip 1 is drop
item_type=0;//0 weapon 1 armor 2 helm
new_item=global.weapons[44];
alarm[0]=3;