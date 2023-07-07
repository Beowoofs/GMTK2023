
function convert_range(value, old_min, old_max, new_min, new_max) {
	
	value = clamp(value, old_min, old_max);
	return (((value - old_min) / (old_max - old_min)) * (new_max - new_min)) + new_min;
	
}