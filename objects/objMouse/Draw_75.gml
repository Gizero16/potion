if (global.tooltip_id != noone && global.tooltip_id != -1) {

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    draw_sprite_stretched(
        sprToolTip,
        0,
        mx - 20,
        my - 50,
        225,
        175
    );

    var text  = global.data[# 0, global.tooltip_id];
    var text2 = global.data[# 1, global.tooltip_id];

    draw_set_colour(c_lime);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text_ext(mx, my - 50 + 10, text, 20, 200);

    draw_set_colour(c_white);
    draw_text_ext(mx, my - 50 + 40, text2, 20, 200);

    window_set_cursor(cr_none);
}
else {
    window_set_cursor(cr_default);
}
