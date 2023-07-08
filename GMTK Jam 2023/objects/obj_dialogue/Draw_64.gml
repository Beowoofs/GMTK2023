draw_set_font(fnt_dialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_alpha(a);

var _len = string_length(text_current);

if (char_current < _len) {
	char_current += char_speed;
}
else {
	
	switch (destroy_state) {
		
		case 0:
			alarm[0] = 3 * room_speed;
			destroy_state = .5
			break;
			
		case 1:
			destroy_state = 1.5
			break;
			
		case 1.5:
			a -= 0.01;
			if (a < 0) {
				instance_destroy();
				exit;
			}
			break;
			
	}
			
}

var _str = string_copy(text_current, 1, char_current);
draw_text_transformed(text_x, text_y, _str, 2, 2, 0);

draw_set_alpha(1);