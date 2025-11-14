
if (global.tooltip_id != noone and global.tooltip_id != -1) {
	draw_sprite_stretched(
sprToolTip,
0,
mouse_x - 20,
mouse_y - 50,
225,
175
)

	var text = global.data[# 0, global.tooltip_id];
	var text2 = global.data[# 1, global.tooltip_id];
	show_debug_message("DISPLAYING MESSAGE")
	draw_set_colour(c_lime);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	draw_text_ext(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), text, 20, 200);
	draw_set_colour(c_white);
	draw_set_valign(fa_top);
	draw_text_ext(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), text2, 20, 200);
	window_set_cursor(cr_none)
} else {
	window_set_cursor(cr_default)
}