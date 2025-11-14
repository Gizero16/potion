var spacing = 50;

draw_sprite_stretched(
sprInventory,
0,
x + 262,
y +190,
300+rowLength*(64),
100+(((HAND_SLOTS-1) div rowLength)+1)*64
)

for (var i = 0; i < HAND_SLOTS; i+=1)
{
	var xx = (x + 315) + (i mod rowLength) * (88+spacing) + 10
	var yy = y + 220 + (i div rowLength) * (88+spacing)
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