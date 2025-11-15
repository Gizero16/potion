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
	
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	with (objInventory)
	{
		
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
				
				var xx = (x + 450) + (i mod rowLength) * (88 + 50) + 10;
				var yy = (y - 300) + (i div rowLength) * (88 + 50);

				// creating hitboxes for each slot
				
				
				
				if (point_in_rectangle(mx, my, xx, yy, xx + 64, yy + 64))
				{
					//show_debug_message("Item in slot =" + string(global.inventory[i][0]) )
					global.tooltip_id = global.inventory[i][0];
					show_debug_message("New Tooltip:" + string(global.tooltip_id))
					other.slotHover = i;
					other.inventoryHover = global.inventory;
				}
			}
		}
	}
	
	with (objCrafting)
	{
		if (point_in_rectangle(
			mx,
			my,
			x - 650,
			y + 200,
			x - 650 + (250 + rowLength * 64),
			y + 200 + (125 + (((CRAFTING_SLOTS - 1) div rowLength) + 1) * 64)
		))
		{
			for (var i = 0; i < CRAFTING_SLOTS; i += 1)
			{
				var xx = (x - 595) + (i mod rowLength) * (88 + 75) + 10;
				var yy = (y + 250) + (i div rowLength) * (88 + 75);

				if (point_in_rectangle(mx, my, xx, yy, xx + 64, yy + 64))
				{
					global.tooltip_id = global.craftInventory[i][0];
					other.slotHover = i;
					other.inventoryHover = global.craftInventory;
				}
			}
		}
	}
	// --- HAND INVENTORY ---
	with (objHand)
	{
		if (point_in_rectangle(
			mx,
			my,
			x + 262,
			y + 190,
			x + 262 + (300 + rowLength * 64),
			y + 190 + (100 + (((HAND_SLOTS - 1) div rowLength) + 1) * 64)
		))
		{
			for (var i = 0; i < HAND_SLOTS; i += 1)
			{
				var xx = (x + 315) + (i mod rowLength) * (70 + 75) + 10;
				var yy = (y + 220) + (i div rowLength) * (88 + 75);

				if (point_in_rectangle(mx, my, xx, yy, xx + 64, yy + 64))
				{
					global.tooltip_id = global.handInventory[i][0];
					other.slotHover = i;
					other.inventoryHover = global.handInventory;
				}
			}
		}
	}
	// --- FOREST INVENTORY ---
with (objInventoryForest)
{
    var ui_x = display_get_gui_width() * 0.5 - 100;
    var ui_y = display_get_gui_height() * 0.5;

    if (point_in_rectangle(
        mx, my,
        ui_x-100,
        ui_y-400,
        ui_x-100 + (300 + rowLength * 64),
        ui_y-400 + (400 + (((INVENTORY_SLOTS - 1) div rowLength) + 1) * 64)
    ))
    {
        for (var i = 0; i < INVENTORY_SLOTS; i++)
        {
            var xx = (ui_x - 50) + (i mod rowLength) * (88 + spacing) + 10;
            var yy = (ui_y - 350) + (i div rowLength) * (88 + spacing);

            if (point_in_rectangle(mx, my, xx, yy, xx + 64, yy + 64))
            {
                global.tooltip_id = global.inventory[i][0];
                other.slotHover = i;
                other.inventoryHover = global.inventory;
            }
        }
    }
}

}


stateFree = function()
{
	mouseOver();
	
	// Drag item if slot not empty
	if( mouse_check_button(mb_left) && (slotHover != -1) && inventoryHover[slotHover][0] != -1){
		state = stateDrag;
		itemDrag = inventoryHover[slotHover][0];
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