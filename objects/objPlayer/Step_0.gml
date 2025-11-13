keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyItemPickup = keyboard_check_pressed(vk_space);
keyAim = mouse_check_button(1);
keyThrow = mouse_check_button_released(1);

inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);
                 // return true if trying to move (true if v or h)

script_execute(state);