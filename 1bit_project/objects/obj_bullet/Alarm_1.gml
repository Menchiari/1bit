/// @description kill
instance_create(obj_fx_debris);
image_index=0;
scr_attack_system(0,spd,damage/2,damage_variation/2,damage/10,1);
if instance_exists(obj_hero)
{
	var _enemy = collision_circle(x,y,100,obj_enemy,true,true)
	{
		if instance_exists(_enemy)
		{
			with _enemy
			{
				ai_target=obj_hero;
				ai_state=ai_states.chase;
			}
		}
	}
}
alarm[2]=1;