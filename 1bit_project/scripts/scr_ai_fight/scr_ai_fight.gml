function scr_ai_fight(){
	if instance_exists(ai_target)
	{
		switch ai_type
		{
			case ai_types.ai_test: scr_ai_test(choose(0,0,0,0,1,2,3,4)); break;
			case ai_types.ai_basic: scr_ai_test(choose(0,2)); break;
			case ai_types.ai_zombie: scr_ai_test(choose(0,2,2,2,4)); break;
			case ai_types.ai_aggressive: scr_ai_test(choose(2,2,3,3,4)); break;
			default: break;
		}
	}
	else
	{
		state=states.idle;
		ai_state=ai_state_original;
	}
}