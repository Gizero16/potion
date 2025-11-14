var cam = view_camera[0];

// where the camera should look
var cx = objPlayer.x - camera_get_view_width(cam)  * 0.5;
var cy = objPlayer.y - camera_get_view_height(cam) * 0.5;


// apply camera position
camera_set_view_pos(cam, cx, cy);