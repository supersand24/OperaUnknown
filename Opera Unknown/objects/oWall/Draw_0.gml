if (drawSpecial) {
	var tx = x + tile_half, ty = y + tile_half;
	
	index = 0;
	
	var north = false, south = false, east = false, west = false;

	//North
	if (place_meeting(	x				,	y - tile_size-1	,oWall)) {
		index += 1;
		north = true;
	}
	
	//East
	if (place_meeting(	x + tile_size	,	y				,oWall)) {
		index += 4;
		east = true;
	}
	
	//South
	if (place_meeting(	x				,	y + tile_size	,oWall)) {
		index += 16;
		south = true
	}
	
	//West
	if (place_meeting(	x - tile_size	,	y				,oWall)) {
		index += 64;
		west = true
	}

	//North East
	if (north && east) {
		if (place_meeting(	x + tile_size	,	y - tile_size-1	,oWall)) { index += 2; }
	}
	
	//South East
	if (south && east) {
		if (place_meeting(	x + tile_size	,	y + tile_size	,oWall)) { index += 8; }
	}

	//South West
	if (south && west) {
		if (place_meeting(	x - tile_size	,	y + tile_size	,oWall)) { index += 32; }
	}

	//North West
	if (north && west) {
		if (place_meeting(	x - tile_size	,	y - tile_size	,oWall)) { index += 128; }
	}
	
	if (index > 255) { index -= 256; }

	//index = 85;

	var sx = 3, sy = 3;

	sx = array_get(global.ctBlob[index],0);
	sy = array_get(global.ctBlob[index],1);

	draw_sprite_part(sWall,0,sx*tile_size,sy*tile_size,tile_size,tile_size,x,y);
	//draw_sprite(sWall,0,0,0);
	//draw_rectangle(sx*tile_size,sy*tile_size,sx*tile_size + tile_size, sy*tile_size + tile_size,true);
} else {
	//draw_self();
}
//draw_self();
draw_set_font(fn_text);
draw_text(x + tile_half,y + tile_half, index);