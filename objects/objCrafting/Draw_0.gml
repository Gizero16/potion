var spacing = 75;

draw_sprite_stretched(
sprInventory,
0,
x-650,
y +200,
250+rowLength*(64),
125+(((CRAFTING_SLOTS-1) div rowLength)+1)*64
)

for (var i = 0; i < CRAFTING_SLOTS; i+=1)
{
	var xx = (x - 595) + (i mod rowLength) * (88+spacing) + 10;
	var yy = y + 250 + (i div rowLength) * (88+spacing);
	var hover = (objMouse.inventoryHover == id) && (objMouse.slotHover == i);
	draw_sprite(sprSlot, hover, xx,yy);
	if (global.craftInventory[i][0] != -1)
	{
		var alpha = 1.0
		if ( objMouse.inventoryDrag == id) && (objMouse.slotDrag == i) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite(sprItems, global.craftInventory[i][0], xx+44, yy+44);
		draw_set_alpha(1.0);
		draw_set_colour(c_white);
		draw_text(xx + 75, yy + 70, string(global.craftInventory[i][1]))
	}
}

if (global.craftInventory[0][0] != -1 && global.craftInventory[1][0] != -1) {
	objBrewButton.visible = true;
} else {
	objBrewButton.visible = false;
}
	
