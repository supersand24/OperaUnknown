// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setWalls() {
	for (var i = 0; i < 4; i++) {
		for (var j = 0; j < 4; j++) {
			global.bigGrid[i][j] = 0;
		}
	}
	
	var startPath = pickStart();
	
	makeMaze(startPath, 1);
	drawWalls();
}

//returns start
function pickStart() {
	//0 top, 1 left, 2 down, 3 right
	
	var start = [-1, -1];
	
		
		var side = irandom_range(0,3);
		var sx, sy;
				if side == 0 {
					sx = irandom_range(0,3);
					sy = 0;
				} else if side == 1 {
					sx = 0;
					sy = irandom_range(0,3);
				} else if side == 2 { 
					sx = irandom_range(0,3);
					sy = 3;
				} else if side == 3 {
					sx = 3;
					sy = irandom_range(0,3);
				}
				start[0] = sx;
				start[1] = sy;
				
		
	return start;
}

function makeMaze(start, counter) {
	/*if (counter > 1) {
		for (var c = 0; c < 4; c++) {
			for (var k = 0; k < 4; k++) {
				show_debug_message(string(global.bigGrid[c][k]) +" | "); 
			}
		}
	}*/
	
	global.bigGrid[start[0]][start[1]] = counter;
	show_debug_message("counter = " + string(counter));
	var cur = start;
	var empty = undefined;
	//show_debug_message(cur[0]);
	//show_debug_message(cur[1]);
	
	if (counter == 16) {
		return;
	}
	
	if (((cur[0] == 0 || cur[0] == 1 || cur[0] == 2 || cur[0] == 3) && (cur[1] == 0 || cur[1] == 3)) || ((cur[1] == 0 || cur[1] == 1 || cur[1] == 2 || cur[1] == 3) && (cur[0] == 0 || cur[0] == 3))) {
		var choice = irandom(4);
		if choice == 0 && counter > 3 {
			return;
			
		} else {
			//up = 1, down = 2, left = 3, right = 4
			//var empty
			//grid[start[0]][start[1]];
			for (var i = 0; i < 4; i++) {
				//up
				if (cur[1]-1 > -1) {
					if (global.bigGrid[cur[0]][cur[1]-1] == 0) {
					empty[i] = 1;
					}
				}
				//down
				if (cur[1]+1 < 4) {
					if (global.bigGrid[cur[0]][cur[1]+1] == 0) {
					empty[i] = 2;
					}
				}
				//left
				if (cur[0]-1 > -1) {
					if (global.bigGrid[cur[0]-1][cur[1]] == 0) {
					empty[i] = 3;
					}
				}
				//right	
				if (cur[0]+1 < 4) {
					if (global.bigGrid[cur[0]+1][cur[1]] == 0) {
					empty[i] = 4;
					}
				}
			}	
	
			if (empty != undefined) {
				var dir = irandom(array_length(empty) == 0);
				//show_debug_message("dir = " + string(dir));
				if empty[dir] == 1 {
					//global.bigGrid[cur[0]][cur[1]-1] = counter;
					//counter++;
					cur = [cur[0], cur[1]-1];
				} else if empty[dir] == 2 {
					//global.bigGrid[cur[0]][cur[1]+1] = counter;
					//counter++;
					cur = [cur[0], cur[1]+1];
				} else if empty[dir] == 3 {
					//global.bigGrid[start[0]-1][start[1]] = counter;
					//counter++;
					cur = [cur[0]-1, cur[1]];
				} else if empty[dir] == 4 {
					//global.bigGrid[cur[0]+1][cur[1]] = counter;
					//counter++;
					cur = [cur[0]+1, cur[1]];
				}
			}
			makeMaze(cur, counter+1);
		}
	} else { 
		//up = 1, down = 2, left = 3, right = 4
			//var empty;
			//grid[start[0]][start[1]];
			for (var i = 0; i < 4; i++) {
				//up
				if (cur[1]-1 > -1) {
					if (global.bigGrid[cur[0]][cur[1]-1] == 0) {
					empty[i] = 1;
					}
				}
				//down
				if (cur[1]+1 < 4) {
					if (global.bigGrid[cur[0]][cur[1]+1] == 0) {
					empty[i] = 2;
					}
				}
				//left
				if (cur[0]-1 > -1) {
					if (global.bigGrid[cur[0]-1][cur[1]] == 0) {
					empty[i] = 3;
					}
				}
				//right	
				if (cur[0]+1 < 4) {
					if (global.bigGrid[cur[0]+1][cur[1]] == 0) {
					empty[i] = 4;
					}
				}
			}
	
			if (empty != undefined) {
				var dir = irandom(array_length(empty)-1);
				//show_debug_message("dir = " + string(dir));
				if empty[dir] == 1 {
					global.bigGrid[cur[0]][cur[1]-1] = counter;
					//counter++;
					cur = [cur[0], cur[1]-1];
				} else if empty[dir] == 2 {
					global.bigGrid[cur[0]][cur[1]+1] = counter;
					//counter++;
					cur = [cur[0], cur[1]+1];
				} else if empty[dir] == 3 {
					global.bigGrid[start[0]-1][start[1]] = counter;
					//counter++;
					cur = [cur[0]-1, cur[1]];
				} else if empty[dir] == 4 {
					global.bigGrid[cur[0]+1][cur[1]] = counter;
					//counter++;
					cur = [cur[0]+1, cur[1]];
				}
			}
			
			makeMaze(cur, counter+1);
	}
}


function drawWalls() {
	draw_set_alpha(1);
	draw_set_color(c_blue);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	//draw_rectangle(0, 0, 5*tile_size, 5*tile_size, true); 
	//draw_rectangle(3*tile_size*5, 5*0*tile_size, 5*tile_size*4, 5*tile_size*1, true); 
	for (var c = 0; c < 4; c++) {
		for (var k = 0; k < 4; k++) {
			if global.bigGrid[c][k] != 0 {
				show_debug_message("c is " + string(c) + " and k is " + string(k));
				draw_text((c+1)*(tile_size*3), (k+1)*(tile_size*3), global.bigGrid[c][k]);
				draw_rectangle(c*tile_size*5, k*tile_size*5, 5*(c+1)*tile_size, 5*(k+1)*tile_size, true); 
			}
		}
	}
	//draw_set_alpha(1);
}


	


	

	
	