// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function timeline(){
	if (global.timeMoving) {
		
		time -= 0.01;
		
		if (time <= 0) {
			global.timeMoving = false;
			myTurn = true;
			time = 0;
		}
		
	}
}