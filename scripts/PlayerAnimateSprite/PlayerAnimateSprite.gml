function PlayerAnimateSprite(){
	//Update Sprite
	
	var _totalFrames = sprite_get_number(sprite_index) / 4; // # of frames per animation (sprite strip has all 4 directions)
	image_index = localFrame + (CARDINAL_DIR * _totalFrames); // mx + b concept: localFrame is set by adding frame in current animation to 0 frame of cardinal direction animation
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
	
	//If animation would loop on next game step
	if (localFrame >= _totalFrames)
	{
		animationEnd = true;
		localFrame -= _totalFrames;
	}
	else
		animationEnd = false;
}