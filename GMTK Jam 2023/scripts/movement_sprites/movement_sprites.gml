
function movement_sprites() {
	
	var delta = (delta_time/1000000) * 60;	
	var _ispd = 1;

	if (x > xprevious) {
		if (sprite_index != sprite) {
			sprite_index = sprite;
		}
		image_speed = _ispd * delta;
		image_xscale = 1;
	 
		afk_timer = base_afk_timer;
	}
	else if (x < xprevious) {
		if (sprite_index != sprite) {
			sprite_index = sprite;
		}
		image_speed = _ispd * delta;
		image_xscale = -1;
			
		afk_timer = base_afk_timer;
	}
	else if (y != yprevious) {
		if (sprite_index != sprite) {
			sprite_index = sprite;
		}
		image_speed = _ispd * delta;
			
		afk_timer = base_afk_timer;
	}
	else {
		if (afk_timer > 0) {
			image_speed = 0;
			image_index = 0;
			afk_timer--;
		}
		else if (sprite_index != sprite_afk) {
			sprite_index = sprite_afk;
			image_index = 0;
			image_speed = .4;
		}
	}

}
