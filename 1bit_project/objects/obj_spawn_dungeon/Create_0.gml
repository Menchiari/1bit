/// @description
//repeat(number_of_enemies)
//{
//	var _spawnchar=instance_create_depth(initial_pos_x,initial_pos_y,-y,obj_character_spawn);
//	_spawnchar.character_type=type_of_enemies;
//	if AI_override==true {_spawnchar.ai_state_var=type_of_ai;}
//}

var center_x = initial_pos_x;
var center_y = initial_pos_y;
var radius = spawn_radius; // Adjust radius to fit within your room bounds

for (var i = 0; i < number_of_enemies; i++)
{
	if number_of_enemies==1
	{
		var spawn_x = x;
		var spawn_y = y;
	}
	else
	{
		if formation==true
		{
			var angle = (i / number_of_enemies) * 360; // degrees
			var spawn_x = center_x + lengthdir_x(radius, angle);
			var spawn_y = center_y + lengthdir_y(radius, angle);
		}
		else
		{
			var spawn_x=x+random_range(radius,-radius);
			var spawn_y=y+random_range(radius,-radius);
		}
	}

	var _spawnchar = instance_create_depth(spawn_x, spawn_y, -spawn_y, obj_character_spawn);
	_spawnchar.character_type=type_of_enemies;
	if AI_override==true {_spawnchar.ai_state=type_of_ai;}
}