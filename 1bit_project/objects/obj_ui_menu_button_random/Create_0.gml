/// @description
scr_init_character();

equip_weapon(global.weapons[irandom_range(1,63)]);
equip_armor(global.armors[irandom_range(0,42)]);
equip_helm(global.helms[irandom_range(0,35)]);

selected=false;