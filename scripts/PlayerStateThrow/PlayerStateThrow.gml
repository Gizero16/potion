function PlayerStateThrow(){
	// movement
	hSpeed = lengthdir_x(inputMagnitude * throwSpeed, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * throwSpeed, inputDirection);

	PlayerCollision();
	
	if (inputMagnitude != 0) 
	{
		direction = inputDirection;
	}
		
	//If animation would end but still moving
	var _totalFrames = sprite_get_number(sprite_index) / 4; // # of frames per animation (sprite strip has all 4 directions)
	if (localFrame < _totalFrames)
	{
		image_index = localFrame + (CARDINAL_DIR * _totalFrames); // mx + b concept: localFrame is set by adding frame in current animation to 0 frame of cardinal direction animation
		localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
		
	}
	else
	{
		if (createOnce) {
			instance_create_layer(x, y, "potions", objPotion);
			show_debug_message("i am being created");
			createOnce = false;
		}
		
	
		localFrame = _totalFrames;
		image_index = localFrame + (CARDINAL_DIR * _totalFrames) - 1;
	}
	
	if (keyThrow)
	{
		show_debug_message("i am done running");
		state = PlayerStateFree;
	}
	
}