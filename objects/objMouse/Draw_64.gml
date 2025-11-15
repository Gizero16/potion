if (itemDrag != -1)
{
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    draw_set_alpha(0.5);
    draw_sprite(sprItems, itemDrag, mx, my);
    draw_set_alpha(1.0);
}
