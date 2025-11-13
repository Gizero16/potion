
state();

if (mouse_x != global.mouse_x_prev || mouse_y != global.mouse_y_prev) { // remove tooltip if mouse moved
	global.tooltip_id = noone;
	global.tooltip_timer = 0;
}


global.mouse_x_prev = mouse_x; // These variables dont have to be globals but im too lazy to change 
global.mouse_y_prev = mouse_y; // Who knows it might come in handy later ? :)