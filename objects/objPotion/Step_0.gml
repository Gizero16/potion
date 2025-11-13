keyThrow = mouse_check_button_released(1);

x = objPlayer.x
y = objPlayer.y

if (keyThrow) {
	instance_destroy();
	show_debug_message("i am being destroyed");
	objPlayer.createOnce = true;
}
