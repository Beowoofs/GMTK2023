
function shake_screen(_mag, _len_frames) {
	with (obj_draw) {
		if (_mag > shake_remain) {
			shake_magnitude = _mag;
			shake_remain = _mag;
			shake_length = _len_frames;	
		}
	}
}