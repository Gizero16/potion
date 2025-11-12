#macro INVENTORY_SLOTS 15
rowLength = 3;
inventory = array_create(INVENTORY_SLOTS, -1);
randomize();
inventory[0] = 2*12+1;
inventory[1] = 3*12;
inventory[2] = 5*12;