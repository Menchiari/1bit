font=fnt_dialogue;
font_allign_h=fa_center;
font_allign_v=fa_middle;
scr_init_character();

weapon=choose(global.weapons[22],global.weapons[15],global.weapons[44],global.weapons[47]);
if (global.unlock_wpn_sword==false && weapon=global.weapons[22])
|| (global.unlock_wpn_katana==false && weapon=global.weapons[44])
|| (global.unlock_wpn_katana_extreme==false && weapon=global.weapons[47])
{room_goto(scr_nextroom_gen());}

//scr_balancing();
text="You have found a "+string(weapon.name);