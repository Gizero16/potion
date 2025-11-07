keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyItemPickup = keyboard_check_pressed(vk_space);
keyAim = mouse_check_button(1);
keyThrow = mouse_check_button_pressed(2);

inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);
                 // return true if trying to move (true if v or h)
// movement
hSpeed = lengthdir_x(inputMagnitude * walkSpeed, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * walkSpeed, inputDirection);

x += hSpeed;
y += vSpeed;

// Keep the player inside the room
x = clamp(x, 0, room_width  - sprite_width  / 2);
y = clamp(y, 0, room_height - sprite_height / 2);