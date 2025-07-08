// This function builds the grid needed for mp_grid pathfinding functions
// It can be rebuilt at any time by calling this function again, but often only needs to be called at the room's start
// It must also be rebuilt when the state of collision objects changes (for example, a breakable wall instance being destroyed)
// In larger rooms where we only build a grid based on whats within the camera view, this must be run whenever the camera moves
function init_pathfinding_grid() {
	if (global.pathfinding_grid) {
		mp_grid_destroy(global.pathfinding_grid);
	}
	
	var _pixel_grid = 4;						// size of grid cells, in pxels
	var _large_rooms = [rm_story_1, rm_world];	// list of "large" rooms to handle by only using the space visible on screen for the grid. update this list as needed
	
	// using a smaller grid is cheaper on the cpu of course, but can lead to bad states if not handled properly / updated when needed
	// therefore I restrict this behavior in the following circumstances:
	// 1. the room we are in is defined as being large enough to require the cropping
	// 2. we are not in follow camera mode (you could do it like that but would require the grid being rebuilt every frame)
	if (array_contains(_large_rooms, room) && instance_exists(obj_camera) && !obj_camera.followcam) {
		// set up the grid with only what is visible to the camera
		var _margin = 64;		// pixel margin outside the camera boundaries to add to our grid. this is critical for locked camera transitions
		global.pathfinding_grid = mp_grid_create(obj_camera.x - global.res_x / 2 - _margin, obj_camera.y - global.res_y / 2 - _margin,
				(global.res_x + _margin * 2) div _pixel_grid, (global.res_y + _margin * 2) div _pixel_grid, _pixel_grid, _pixel_grid);
	}
	else {
		// by default, use the entire room space for the grid. this is acceptable for most small - medium rooms
		global.pathfinding_grid = mp_grid_create(0, 0, room_width div _pixel_grid, room_height div _pixel_grid, _pixel_grid, _pixel_grid);
	}
	
	// finally, add the parent class we want pathfinders to avoid
	mp_grid_add_instances(global.pathfinding_grid, obj_avoid, true);
}