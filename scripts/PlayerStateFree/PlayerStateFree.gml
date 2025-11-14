function PlayerStateFree(){
	// movement
	hSpeed = lengthdir_x(inputMagnitude * walkSpeed, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * walkSpeed, inputDirection);

	PlayerCollision();

	// Update sprite index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0) 
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	}
	else
		sprite_index = spriteIdle;

	if (_oldSprite != sprite_index)
		localFrame = 0;

	//Update Image Index
	PlayerAnimateSprite();	
	
	if (keyAim && !throwCooldown)
	{
		//Update Sprite
		sprite_index = spriteThrow;
		state = PlayerStateThrow;
	}
}