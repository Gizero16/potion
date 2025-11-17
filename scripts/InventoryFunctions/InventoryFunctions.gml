function InventorySearch(inv, itemType)
{
    for (var i = 0; i < array_length(inv); i++)
    {
        if (inv[i][0] == itemType)
            return i;
    }
    return -1;
}

function InventoryRemove(inv, itemType)
{
    var _slot = InventorySearch(inv, itemType);

    if (_slot != -1)
    {
        inv[_slot][1] -= 1;

        if (inv[_slot][1] <= 0)
        {
            inv[_slot][0] = -1;
            inv[_slot][1] = 0;
        }

        return true;
    }
    return false;
}

function InventoryFindNonFull(inv, itemType) {
    for (var i = 0; i < array_length(inv); i++) {
        if (inv[i][0] == itemType && inv[i][1] < STACK_MAX) {
            return i;
        }
    }
    return -1;
}

function InventoryAdd(inv, itemType)
{
    // 1 Find a stack that isn't full
    var nonFull = InventoryFindNonFull(inv, itemType);

    if (nonFull != -1) {
        inv[nonFull][1] += 1;
        return true;
    }

    // 2 If no non-full stack exists, find an empty slot
    var empty = InventorySearch(inv, -1);

    if (empty != -1) {
        inv[empty][0] = itemType;
        inv[empty][1] = 1;
        return true;
    }

    // 3 Inventory full
    return false;
}

function PlayerGiveItem(itemType)
{
    // Try adding to hand first
    if (InventoryAdd(global.handInventory, itemType)) {
        return true;
    }

    // Then try main inventory
    if (InventoryAdd(global.inventory, itemType)) {
        return true;
    }

    // If both failed: inventory full
    return false;
}

function InventorySwap(invFrom, slotFrom, invTo, slotTo)
{
    var a_id  = invFrom[slotFrom][0];
    var a_amt = invFrom[slotFrom][1];

    var b_id  = invTo[slotTo][0];
    var b_amt = invTo[slotTo][1];

    // if both items are the same
    if (a_id == b_id && a_id != -1)
    {
        var total = a_amt + b_amt;

        // cap at 16
        var new_to  = min(total, 16);
        var new_from = total - new_to;

        // write new values
        invTo[slotTo][1] = new_to;

        if (new_from > 0) {
            invFrom[slotFrom][1] = new_from;
        } else {
            invFrom[slotFrom][0] = -1;
            invFrom[slotFrom][1] = 0;
        }

        return;
    }


    var temp = invFrom[slotFrom];
    invFrom[slotFrom] = invTo[slotTo];
    invTo[slotTo] = temp;
}

<<<<<<< Updated upstream
function craftItem(itemA, itemB, recipes) {
	for (i = 0; i < objCrafting.numRecipes; i++) {
		if(recipes[i][0] == itemA && recipes[i][1] == itemB){
			show_debug_message("itemA:"+ string(itemA))
			show_debug_message("itemB:" + string(itemB))
			
			InventoryAdd(global.inventory, i)
			InventoryRemove(global.craftInventory, itemA)
			InventoryRemove(global.craftInventory, itemB)
			return i;
		}
	}
	InventoryRemove(global.craftInventory, itemA)
	InventoryRemove(global.craftInventory, itemB)
	return -1;
	
=======

function craftItem(itemA, itemB, recipes)
{
    // Try every recipe
    for (var i = 0; i < objCrafting.numRecipes; i++)
    {
        if (recipes[i][0] == itemA && recipes[i][1] == itemB)
        {
            // SUCCESSFUL recipe
            show_debug_message("Craft success: " + string(i));
>>>>>>> Stashed changes

            // Try to give crafted item
            PlayerGiveItem(i);

            // REMOVE ingredients (successful craft)
            InventoryRemove(global.craftInventory, itemA);
            InventoryRemove(global.craftInventory, itemB);

            return i; // return crafted item
        }
    }

    // NO RECIPES MATCHED → FAIL, but still remove resources!
    show_debug_message("Craft failed; items consumed.");

    InventoryRemove(global.craftInventory, itemA);
    InventoryRemove(global.craftInventory, itemB);

    return -1;
}