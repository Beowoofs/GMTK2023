
function movement() {
	if live_call() return live_result;
	
	var _dt = delta_time/1000000;
	
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_down = keyboard_check(ord("S"));
	key_up = keyboard_check(ord("W"));

	var key_hor  = key_right - key_left;
	var key_vert = key_down - key_up;
	
	var delta = _dt * 60;
	var _spd = spd;

	//Movement
	var _mdir = point_direction(0, 0, key_hor, key_vert);
	
	//---Calculate potential movement--//
	var _aspd = _spd*delta;

	var _mpx = lengthdir_x(_aspd, _mdir) * abs(key_hor);
	var _mpy = lengthdir_y(_aspd, _mdir) * abs(key_vert);
			
	//-------Check for collision-------//
	var _border = 10;
	var _max_move = 40;
	var _cur_move = 0;
	//X
	if (place_meeting(x+_mpx, y, par_collision)) {
		while !place_meeting(x+(sign(key_hor)*_border), y, par_collision) {
			x += key_hor * delta;
			_cur_move += key_hor * delta;
			if (_cur_move > _max_move) { exit; }
		}
		if place_meeting(x+(sign(key_hor)*_border), y+_border*2, par_collision) {
			y -= _aspd;
			_cur_move -= _aspd;
			if (_cur_move > _max_move) { exit; }
		}
   
		if place_meeting(x+(sign(key_hor)*_border), y-_border*2, par_collision) {
			y += _aspd;
			_cur_move += _aspd;
			if (_cur_move > _max_move) { exit; }
		}
	}
	else {
		x += _mpx;
	}
	//Y
	if (place_meeting(x, y+_mpy, par_collision)) {
		while !place_meeting(x, y+(sign(key_vert)*_border), par_collision) {
			y += key_vert * delta;
			_cur_move += key_vert * delta;
			if (_cur_move > _max_move) { exit; }
		}
		if place_meeting(x+_border*2, y+(sign(key_vert)*_border), par_collision) {
			x -= _aspd;
			_cur_move -= _aspd;
			if (_cur_move > _max_move) { exit; }
		}
   
		if place_meeting(x-_border*2, y+(sign(key_vert)*_border), par_collision) {
			x += _aspd;
			_cur_move += _aspd;
			if (_cur_move > _max_move) { exit; }
		}
	}
	else {
		y += _mpy;
	}
		 

}