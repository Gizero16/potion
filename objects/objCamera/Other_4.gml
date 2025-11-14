
	// Force viewport to be what this room wants
	view_set_wport(0, 960);
	view_set_hport(0, 960);

	// Force camera size for this room
	var cam = camera_create_view(0, 0, 960, 960);
	view_set_camera(0, cam);
	view_set_visible(0, true);

	
	var _cam_width = 960;
	var _cam_height = 960;
	surface_resize(application_surface, _cam_width, _cam_height);
