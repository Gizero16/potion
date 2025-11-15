
if (mouse_check_button_pressed(mb_left) && visible == true) 
{
    if (position_meeting(mouse_x, mouse_y, id))
    {
        with (objCrafting) {
		var a =  global.craftInventory[0][0]
		var b = global.craftInventory[1][0]
		
		if (b < a) { // swap ID's, lower value id has to be first for crafting to work
			var t = a;
			a = b;
			b = t;
		}
		
		show_debug_message(string(craftItem(a, b, recipes)));
		
	
		
		
		
		
    }
	}
}