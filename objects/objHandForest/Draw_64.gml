var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();



draw_sprite_stretched(
sprInventory,
0,
x,
y + 460,
190+rowLength*(64),
40+(((HAND_SLOTS-1) div rowLength)+1)*64
)

for (var i = 0; i < HAND_SLOTS; i+=1)
{
	var xx = (x) + (i mod rowLength) * (88+spacing) + 10
	var yy = y + 465 + (i div rowLength) * (88+spacing)
	var hover = (objMouse.inventoryHover == id) && (objMouse.slotHover == i)
	draw_sprite(sprSlot, hover, xx,yy)
	if (global.handInventory[i][0] != -1)
	{
		var alpha = 1.0
		if ( objMouse.inventoryDrag == id) && (objMouse.slotDrag == i) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite(sprItems, global.handInventory[i][0], xx+44, yy+44);
		draw_set_alpha(1.0)
		draw_set_colour(c_white)
		draw_text(xx + 75, yy + 70, string(global.handInventory[i][1]))
	}
}