// @desc move player
//@param directions
function move() {
	var dir = argument0;
	var components = global.components[dir];
	var dx = components[0];
	var dy = components[1];
	
	if (myTurn) {
		if (state == states.idle) {
			if ((place_empty(x+(dx * tile_width), y+(dy * tile_height)) && ((x+(dx * tile_width)) <= rm_size-10 && (x+(dx * tile_width) > 10)) &&  ((y+(dy * tile_width) <= rm_size-10) && (y+(dy * tile_width) > 10)))) {
				x_from = x_pos;
				y_from = y_pos;
	
				x_to = x_pos + dx;
				y_to = y_pos + dy;
		
	
				x_pos = x_to;
				y_pos = y_to;
	
				state = states.walking;
			
				time = 1;
				global.timeMoving = true;
				myTurn = false;
			
				//show_debug_message("im walking");
		
			} else {
			//show_debug_message("theres an object in my way");
			}
		
		}
	}
}