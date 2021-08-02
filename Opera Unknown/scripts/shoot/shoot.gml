// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shoot(i){
	var _lazer = instance_create_layer(x+tile_half,y+tile_half,"Instances",oLazer);
	_lazer.direction = point_direction(x,y,controller.enemy[0].x,controller.enemy[0].y);
	_lazer.image_angle = _lazer.direction;
	_lazer.speed = tile_half;
	_lazer.bullets = burst;
	_lazer.user = controller.p1;
	
	/*
	//supposed to remove the enemy from the aray after its killed, but doesnt work since an array is used instead of a ds list
	if (controller.enemy[i].hp <= 0) {
		controller.enemy[i] = undefined;
	}*/
	
}