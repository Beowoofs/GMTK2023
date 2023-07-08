
#macro main_cam view_camera[0]

base_width = 320;
base_height = 180;
d3d = false;

#region // DEPTH SORTER //

// Create Instance Variables
depthList    = ds_list_create();
sortingLayer = layer_get_id("Instances");
x_to         = 0;
y_to         = 0;
follow       = noone;
follow_spd   = 5;
follow_base_spd = 5;
u_depth      = shader_get_uniform(sh_3d, "dpth");
u_enabled    = shader_get_uniform(sh_3d, "enabled");

if (instance_number(object_index) > 1) {
	instance_destroy();
	exit;
}

fullscreen   = false;
fullscreen_ratio = 1;

monitor_width  = display_get_width();
monitor_height = display_get_height();

var _i = 1;
while ((monitor_width >= base_width*_i) && (monitor_height >= base_height*_i)) {
	
	screen_sizes[_i*2-2] = base_width*(_i);
	screen_sizes[_i*2-1] = base_height*(_i);
	
	_i++;
}

size_to     = clamp(floor((array_length(screen_sizes)-1)*.5)-2, 0, floor((array_length(screen_sizes)-1)*.5));

show_debug_message("----------WINDOW SETTINGS----------");
show_debug_message(screen_sizes);
show_debug_message(size_to);
show_debug_message(fullscreen);
show_debug_message("-----------------------------------");

size_to     = clamp(size_to, 0, floor((array_length(screen_sizes)-1)*.5));

#endregion

// SCREENSHAKE //
shake_length    = 0;
shake_magnitude = 0;
shake_remain    = 0;

