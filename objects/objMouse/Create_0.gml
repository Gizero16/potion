// state machine!!


inventoryHover = -1;
slotHover = -1;
inventoryDrag = -1;
slotDrag = -1;
itemDrag = -1;

mouseOver = function()
{
	slotHover = -1;
	inventoryHover = -1;

	var mx = mouse_x;
	var my = mouse_y;
	
	with (objInventory)
	{
		// match the draw_sprite_stretched bounds
		if (point_in_rectangle(
			mx,
			my,
			x + 390,
			y - 400,
			x + 390 + (300 + rowLength * 64),
			y - 400 + (500 + (((INVENTORY_SLOTS - 1) div rowLength) + 1) * 64)
		))
		{
			for (var i = 0; i < INVENTORY_SLOTS; i += 1)
			{
				// match the same positioning used in draw
				var xx = (x + 450) + (i mod rowLength) * (88 + 50) + 10;
				var yy = (y - 300) + (i div rowLength) * (88 + 50);

				// use same slot size as your sprites (64x64)
				if (point_in_rectangle(mx, my, xx, yy, xx + 64, yy + 64))
				{
					other.slotHover = i;
					other.inventoryHover = id;
				}
			}
		}
	}
}


stateFree = function()
{
	mouseOver();
	
	// Drag item if slot not empty
	if( mouse_check_button(mb_left) && (slotHover != -1) && inventoryHover.inventory[slotHover] != -1){
		state = stateDrag;
		itemDrag = inventoryHover.inventory[slotHover];
		inventoryDrag = inventoryHover
		slotDrag = slotHover;
	}
}

stateDrag = function()
{
	mouseOver();
	if (!mouse_check_button(mb_left)){
		// Swap slot
		if(slotHover != -1) InventorySwap(inventoryDrag, slotDrag, inventoryHover, slotHover)
		
		// Free up state
		state = stateFree;
		itemDrag = -1;
		inventoryDrag = -1;
		slotDrag = -1;
	}
}

state = stateFree;