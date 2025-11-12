var spacing = 50;

draw_sprite_stretched(
sprInventory,
0,
x+390,
y -400,
300+rowLength*(64),
500+(((INVENTORY_SLOTS-1) div rowLength)+1)*64
)

for (var i = 0; i < INVENTORY_SLOTS; i+=1)
{
	var xx = (x + 450) + (i mod rowLength) * (88+spacing) + 10
	var yy = y - 300 + (i div rowLength) * (88+spacing)
	var hover = (objMouse.inventoryHover == id) && (objMouse.slotHover == i)
	draw_sprite(sprSlot, hover, xx,yy)
	if (inventory[i] != -1)
	{
		var alpha = 1.0
		if ( objMouse.inventoryDrag == id) && (objMouse.slotDrag == i) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite(sprPotions, inventory[i], xx, yy);
		draw_set_alpha(1.0)
	}
}