// @desc move player
//@param directions
function move() {
	var dir = argument0;
	var components = global.components[dir];
	var dx = components[0];
	var dy = components[1];

	

	if (state == states.idle) {
		if ((place_empty(x+(dx * tile_size), y+(dy * tile_size)) && ((x+(dx * tile_size)) <= rm_size-10 && (x+(dx * tile_size) > 10)) &&  ((y+(dy * tile_size) <= rm_size-10) && (y+(dy * tile_size) > 10)))) {
			x_from = x_pos;
			y_from = y_pos;
	
			x_to = x_pos + dx;
			y_to = y_pos + dy;
		
	
			x_pos = x_to;
			y_pos = y_to;
	
			state = states.walking;
			
			//show_debug_message("im walking");
		
		} else {
		//show_debug_message("theres an object in my way");
		}
		
	}
}