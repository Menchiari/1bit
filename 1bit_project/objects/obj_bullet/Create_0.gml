hp=0;
hp_max=0;
str=1;
res=0;

dir=0;
spd=random_range(30,40);
spread=10;
duration=random_range(6,8);

destx=x;
desty=y;

damage=1;
damage_variation=1;
bullets=1;

active=false;
hit=false;

faction=factions.ally;
melee_atk_buffer=0;
melee_atk_buffer_index=0;
melee_atk_buffer_br=0;
melee_atk_buffer_index_br=0;

alarm[0]=4;

show_debug_message("bullet shot");
