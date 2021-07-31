/// @description Init player
// You can write your code in this editor
enum states {
	idle, walking
}
state = states.idle;

x_pos = x div tile_size;
y_pos = y div tile_size;

x_from = x_pos;
y_from = y_pos;

x_to = x_pos;
y_to = y_pos;

walk_anim_length = .5;
walk_anim_time = 0;