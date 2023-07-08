draw_set_alpha(a);
draw_set_color(c_black);

draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_alpha(1);
draw_set_color(c_white);

a-=0.002;

if (a < 0) { instance_destroy(); }