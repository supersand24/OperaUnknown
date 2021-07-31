// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
gml_pragma("global", "MACRO()");

//size of the tile
#macro tile_size 20

//size of the room for checking out of bounds
#macro rm_size 600

//collection for directions unit can move
enum directions {
	right,
	up,
	left,
	down
}

//changes in x and y based on direction
global.components = [];
global.components[directions.right] = [1,0];
global.components[directions.up] = [0,-1];
global.components[directions.left] = [-1,0];
global.components[directions.down] = [0,1];
