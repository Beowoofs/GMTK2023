/// @desc PRE-DRAW EVENT

// Clear Sort List
ds_list_clear(depthList);

// Define Camera View Coordinates
var _extra_border = 100;
var cam_x1		  = camera_get_view_x(main_cam)-_extra_border;
var cam_y1		  = camera_get_view_y(main_cam)-_extra_border;
var cam_x2		  = cam_x1 + camera_get_view_width(main_cam)+_extra_border*2;
var cam_y2		  = cam_y1 + camera_get_view_height(main_cam)+_extra_border*2;

// Define Local Variables
var loop = 0;
var xx = 0;
var yy = 0;
var width = 0;
var height = 0;

// Get All Elements On Invisible Layer && Loop
var elements = layer_get_all_elements(sortingLayer);
repeat (array_length_1d(elements)) {
	xx = undefined;
	// Object Instances
	if (layer_get_element_type(elements[loop]) == layerelementtype_instance) {
		var thisInst = layer_instance_get_instance(elements[loop]);
		xx = thisInst.x;
		yy = thisInst.y;
		width = thisInst.sprite_width;
		height = thisInst.sprite_height;
	}
	// If Within Screen View Add To Sorting List
	if (xx != undefined && xx + width >= cam_x1 && xx - width <= cam_x2 && yy + height >= cam_y1 && yy - height <= cam_y2) {
		ds_list_add(depthList, (elements[loop] | yy << 32) );
	}
	
	loop++;
}

// Sort List According to Y value
ds_list_sort(depthList, true);