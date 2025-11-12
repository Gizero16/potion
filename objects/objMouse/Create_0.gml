// state machine!!

inventoryHover = -1;
slotHover = -1;
inventoryDrag = -1;
slotDrag = -1;
itemDrag = -1;

mouseOver = function()
{
	// reset vars
	slotHover = -1;
	inventoryHover = -1;

	var mx = mouse_x
	var my = mouse_y
	
	with (objInventory)
	{
		if (point_in_rectangle( // check if mouse is over inventory
		mx,
		my,
		x-6,
		y-6,
		x-6 + 12 + rowLength*36,
		y-6 + 12+(((INVENTORY_SLOTS-1) div rowLength) + 1) * 36
		))
	{
		for(var i = 0; i < INVENTORY_SLOTS; i+=1)
		{
			var xx = x + (i mod rowLength) * 36 + 2;
			var yy = y + (i div rowLength) * 36 + 2;
			if (point_in_rectangle(mx, my, xx, yy, xx+32, yy+32))
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