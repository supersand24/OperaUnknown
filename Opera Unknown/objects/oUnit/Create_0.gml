/// @description Init player
// You can write your code in this editor

// sets states for movement
enum states {
	idle, walking
}

state = states.idle;

x_pos = x div tile_size;
y_pos = y div tile_size;

//set the current position for movement calc
x_from = x_pos;
y_from = y_pos;

//intialize the future pos to current since it isnt moving
x_to = x_pos;
y_to = y_pos;

//sets animation length for animations
walk_anim_length = .5;
walk_anim_time = 0;