function PlayerStatePickup(){

	
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
		if (instance_exists(objItem))
			objItem.pickedUp = true;
		localFrame = _totalFrames;
		image_index = localFrame + (CARDINAL_DIR * _totalFrames) - 1;
		show_debug_message("i am done running");
		state = PlayerStateFree;
	}
	
}