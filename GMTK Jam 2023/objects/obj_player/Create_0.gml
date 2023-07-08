ableToMove = false;
spd = 5;
key_left = 0;
key_right = 0;
key_down = 0;
key_up = 0;

afk_timer = 0;
base_afk_timer = 10 * room_speed;

sprite = spr_player_walking;
sprite_afk = spr_player_idle;

alarm[0] = 3 * room_speed;
alarm[1] = 1;
