var spacing = 50;

var ui_x = display_get_gui_width() * 0.5 - 100;
var ui_y = display_get_gui_height() * 0.5;

draw_sprite_stretched(
sprInventory,
0,
ui_x-100,
ui_y -400,
300+rowLength*(64),
400+(((INVENTORY_SLOTS-1) div rowLength)+1)*64
)

for (var i = 0; i < INVENTORY_SLOTS; i+=1)
{
	var xx = (ui_x - 50) + (i mod rowLength) * (88+spacing) + 10
	var yy = ui_y - 350 + (i div rowLength) * (88+spacing)
	var hover = (objMouse.inventoryHover == id) && (objMouse.slotHover == i)
	draw_sprite(sprSlot, hover, xx,yy)
	if (global.inventory[i][0] != -1)
	{
		var alpha = 1.0
		if ( objMouse.inventoryDrag == id) && (objMouse.slotDrag == i) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite(sprItems, global.inventory[i][0], xx+44, yy+44);
		draw_set_colour(c_white)
		draw_text(xx + 75, yy + 70, string(global.inventory[i][1]))
		draw_set_alpha(1.0)
	}
}