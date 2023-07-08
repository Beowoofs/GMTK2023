/// @desc DRAW EVENT

if (d3d) {
	shader_set(sh_3d);
	u_depth = shader_get_uniform(sh_3d, "dpth");
	u_enabled = shader_get_uniform(sh_3d, "enabled");

	var _loop = 0;
	repeat (ds_list_size(depthList)) {
		var _element_id = depthList[| _loop] &$ffffffff;
		if (layer_get_element_type(_element_id) == layerelementtype_instance) {
			var _inst = layer_instance_get_instance(_element_id);
			shader_set_uniform_f(u_depth, (_inst.y+(_inst.sprite_height-_inst.sprite_yoffset)));
			shader_set_uniform_f(u_enabled, (_inst.e3d));
			with (_inst) {
				event_perform(ev_draw, 0);
			}
		}
		_loop++;
	}

	shader_reset();
	
}
else {

	var _loop = 0;
	repeat (ds_list_size(depthList)) {
		var _element_id = depthList[| _loop] &$ffffffff;
		if (layer_get_element_type(_element_id) == layerelementtype_instance) {
			var _inst = layer_instance_get_instance(_element_id);
			with (_inst) {
				event_perform(ev_draw, 0);
			}
		}
		_loop++;
	}
	
}