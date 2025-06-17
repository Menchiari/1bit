scr_init_character();

equip_weapon(global.weapons[irandom_range(1,63)]);
equip_armor(global.armors[irandom_range(0,42)]);
equip_helm(global.helms[irandom_range(0,35)]);

chosen_column=3;
button_pressed=0;
shop_text="EQUIP";
shop_text_cancel="CANCEL";
description="tap above to swap an item"
description_str=0;
description_res=0;
description_spd=0;
description_cha=0;
shop_text_color=c_white;

//equipment stuff
slot_name[3]=name;
slot_name[0]=weapon.name;
slot_name[1]=armor.name;
slot_name[2]=helm.name;
slot_sprite[0]=weapon_sprite; //spr_null;
slot_sprite[1]=armor.sprite;
slot_sprite[2]=helm.sprite;
slot_description[0]=weapon.description;
slot_description[1]=armor.description;
slot_description[2]=helm.description;


//backend shop stuff
active=1;
shop_active=0;
radius=16;

active_range=20;
reactive_range=60;

xoff=sprite_get_xoffset(sprite_index);
yoff=sprite_get_yoffset(sprite_index);

xoriginal=x;
yoriginal=y;

x0=x-xoff+21;
x1=x-xoff+50;
x2=x-xoff+78;
x3=x-xoff+107;
y0=y-yoff+24;
y1=y-yoff+42;
bx0=x-xoff+22;
bx1=x-xoff+106;
by0=y-yoff+69;
by1=y-yoff+85;
tx1=x-xoff+20;
ty1=y-yoff+13;
tx2=x-xoff+109;
ty2=y-yoff+24;
cx1=x-xoff+20;
cy1=y-yoff+42;
cx2=x-xoff+109;
cy2=y-yoff+68;

stats=false;
shop=false;

if collision_point(x,y,obj_neutral_death,true,true) {instance_destroy();}