/// @description Update camera

	
//Update destination
if (instance_exists(follow)) {
	x_to = follow.x;
	y_to = follow.y;
}
else if (instance_exists(obj_player)) {
	if (follow_spd > follow_base_spd) {
		follow_spd = approach(follow_spd, follow_base_spd, 0.5);	
	}

	x_to = obj_player.x;
	y_to = obj_player.y;
}
else {
	x = (base_width/fullscreen_ratio) *.5;	
	y = (base_height/fullscreen_ratio)*.5;	
}

x += (x_to - x) / follow_spd;
y += (y_to - y) / follow_spd;

//Keep camera center inside room
var _wh = camera_get_view_width(main_cam)*.5;
var _hh = camera_get_view_height(main_cam)*.5;

//Screenshake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - ((1/shake_length) * shake_magnitude));

//Set camera
camera_set_view_pos(main_cam, x - _wh, y - _hh);
