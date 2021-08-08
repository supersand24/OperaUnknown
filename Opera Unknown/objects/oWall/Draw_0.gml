draw_sprite_part(sWall,0,sx*tile_size,sy*tile_size,tile_size,tile_size,x,y);

if (global.ctIndexes) {
	draw_set_font(fn_text);
	draw_text(x + tile_half,y + tile_half, index);
}