// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function target(){
	var targets = undefined;
	var target_index = 0;
	
	//looks at all enemies and check if theyre in range
	for (var i = 0; i < array_length(controller.enemy); i++) {
		if (controller.enemy[i] != undefined) {
			
			//checks if object is in range
			if (point_distance(x + tile_half,y + tile_half, controller.enemy[i].x + tile_half, controller.enemy[i].y + tile_half) <= tile_size * range) {
				var _list = ds_list_create();
				var _num = collision_line_list(x + tile_half,y + tile_half, controller.enemy[i].x + tile_half, controller.enemy[i].y + tile_half, oEntity, false, true, _list, true);
			
				//checks if only one collision and if its parent is oEnemyParent
				if (_num == 1 && object_get_parent(_list[| 0].object_index) == oEnemyParent) {
					targets[target_index] = i;
					target_index++;
					//draw_sprite(sTarget, image_index, controller.enemy[i].x, controller.enemy[i].y);
					ds_list_destroy(_list);
				} else {
					ds_list_destroy(_list);
				}
			}
		}
	}
	
	draw_set_alpha(1);
	return targets;
}