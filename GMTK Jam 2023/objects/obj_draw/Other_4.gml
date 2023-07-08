// Create Instance Variables
depthList    = ds_list_create();
sortingLayer = layer_get_id("Instances");

// Get All Elements On Invisible Layer && Loop
var _loop = 0;
var _elements = layer_get_all_elements(sortingLayer);
repeat (array_length_1d(_elements)) {
	// Object Instances
	if (layer_get_element_type(_elements[_loop]) == layerelementtype_instance) {
		var _inst = layer_instance_get_instance(_elements[_loop]);
		if !(variable_instance_exists(_inst, "e3d")) {
			variable_instance_set(_inst, "e3d", false);
			_inst.e3d = false;
		}
	}
	_loop++;
}

event_perform(ev_other, ev_user0);