function InventorySearch(inv, itemType)
{
    for (var i = 0; i < INVENTORY_SLOTS; i++)
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


function InventoryAdd(inv, itemType)
{
    var _slot     = InventorySearch(inv, -1);
    var itemAlrIn = InventorySearch(inv, itemType);

    if (_slot != -1 && itemAlrIn == -1)
    {
        inv[_slot][0] = itemType;
        inv[_slot][1] += 1;
        return true;
    }

    if (_slot != -1 && itemAlrIn != -1)
    {
        inv[itemAlrIn][1] += 1;
        return true;
    }

    return false;
}


function InventorySwap(invFrom, slotFrom, invTo, slotTo)
{
    var temp = invFrom[slotFrom];
    invFrom[slotFrom] = invTo[slotTo];
    invTo[slotTo] = temp;
}

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
	

}
