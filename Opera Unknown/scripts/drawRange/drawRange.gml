// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawRange(){
	draw_set_alpha(0.2);
	draw_circle(x + tile_half,y + tile_half, (tile_size * range),false);
	draw_set_alpha(1);
}