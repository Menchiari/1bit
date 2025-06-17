scr_loadgame();
scr_init_character();

lineax1=random_range(0,sprite_width);
lineax2=random_range(0,sprite_width);
linebx1=random_range(0,sprite_width);
linebx2=random_range(0,sprite_width);
linecx1=random_range(0,sprite_width);
linecx2=random_range(0,sprite_width);
selected=false;

text="";
color=c_white;
alpha=1;
font=fnt_dialogue;

wpn_button_select=ds_list_find_index(global.unlock_wpn,global.player_weapon.index); //irandom_range(0,ds_list_size(global.unlock_wpn)-1) //ds_list_size(global.unlock_wpn)-1//global.unlock_wpn-1;//irandom_range(0,4);
arm_button_select=ds_list_find_index(global.unlock_arm,global.player_armor.index); //irandom_range(0,ds_list_size(global.unlock_arm)-1) //global.unlock_arm-1;//irandom_range(0,4);
hlm_button_select=ds_list_find_index(global.unlock_hlm,global.player_helm.index); //irandom_range(0,ds_list_size(global.unlock_hlm)-1) //global.unlock_hlm-1;//irandom_range(0,4);
type=0;

//wpn1=irandom_range(0,49);
//wpn2=irandom_range(0,49);
//wpn3=irandom_range(0,49);
//wpn4=irandom_range(0,49);
//wpn5=irandom_range(0,49);

//arm1=irandom_range(0,30);
//arm2=irandom_range(0,30);
//arm3=irandom_range(0,30);
//arm4=irandom_range(0,30);
//arm5=irandom_range(0,30);

//hlm1=irandom_range(0,30);
//hlm2=irandom_range(0,30);
//hlm3=irandom_range(0,30);
//hlm4=irandom_range(0,30);
//hlm5=irandom_range(0,30);


//wpn_index = 0;

