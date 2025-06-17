/// @description die
instance_create(obj_death);
if instance_exists(obj_hero){obj_hero.hp=obj_hero.hp_max;}
scr_savegame();
ini_open("save.sav");
ini_write_real("DEBUG","PLAYERSPAWN_X",spawn_death_x);
ini_write_real("DEBUG","PLAYERSPAWN_Y",spawn_death_y);
ini_close();