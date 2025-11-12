if (itemDrag != -1)
{
	draw_set_alpha(0.5);
	draw_sprite(sprPotions, itemDrag, mouse_x, mouse_y)
	draw_set_alpha(1.0);
}

if (tooltip_id != noone) {
	var text_index = tooltip_id.slotHover;
	var text = global.data[# 0, text_index];
	show_debug_message("Displaying text!")
	draw_set_colour(c_lime);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	draw_text_ext(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), text, 20, 200);
}