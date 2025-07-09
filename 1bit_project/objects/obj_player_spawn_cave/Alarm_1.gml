/// @description activate Hero
obj_hero.x=x;obj_hero.y=y;
obj_hero.state=states.sit_idle;
obj_hero.speed=0;
with (obj_hero) {visible = true;speech_text="ouch...";}
instance_destroy();