// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shoot(i){
	if (controller.enemy[i].targetAble) {
		
		
		//var dist = point_distance(x + tile_half,y + tile_half, controller.enemy[i].x + tile_half, controller.enemy[i].y + tile_half);
		
		//loops for however many shots are in a burst fire
		for (var int = 0; int < burst; int++) {
			
			//moves the lazer the distance from the shooter to the target
			
			//var travel = 0;
			//var lazer = instance_create_layer(x*tile_size,y*tile_size,"Instances",oLazer);
			
			//while (travel <= dist) {
			with (instance_create_layer(x, y, "lazers", oLazer))
				{
					direction = point_direction(x*tile_size, y*tile_size, controller.enemy[i].x, controller.enemy[i].y);
					speed = -10;
					hspeed = 10;
				}
			//}
			//instance_destroy(lazer);
			
			controller.enemy[i].hp -= dmg;
			instance_destroy(oLazer);
		}
			
		//supposed to remove the enemy from the aray after its killed, but doesnt work since an array is used instead of a ds list
		if (controller.enemy[i].hp <= 0) {
			controller.enemy[i] = undefined;
		}
	}
}