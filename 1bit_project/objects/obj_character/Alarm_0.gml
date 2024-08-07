///@description refresh main variables
scr_balancing();
hp=hp_max;
hp_min=hp_max/5;
hp_recharge=hp_recharge_default;
ai_state=ai_state_original;
ai_responsiveness=ai_responsiveness/(spd);
ai_timer_attack1=animset_atk1_time//+ai_responsiveness;
ai_timer_attack2=animset_atk2_time+ai_responsiveness;