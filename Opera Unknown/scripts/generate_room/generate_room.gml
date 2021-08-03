// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//gets the last door picked to choose if the encounter is pain or not
//var door = last_door;

//sets all insatnces in the room
function setRoom() {
	deleteWalls();
	setWalls();
	moveAllies();
	setEnemies(getCount(), getTypes());
	roomCount++;
}

//moves allies to top left
function moveAllies() {
	var newX = 0;
	var newY = 1;
	for (var i = 0; i < array_length(ally); i++) {
		ally[i].x = newX * tile_size;
		ally[i].y = newY * tile_size;
		newX++;
		
		if newX == 3 {
			newX = 0;
			newY = 2;
		}
	}
}

//sets the types of enemies for the encounter
//enemyTypes = [oRobot, oPuppy, oGrunt, oSoldier, oBeast, oSniper, oBerserker, oCommander];
function getTypes() {
	var types = [];
	if roomCount == 0 {
		types = [enemyTypes[0], enemyTypes[1]];
	} else if roomCount > 0 && roomCount <= 4 {
		types =  [enemyTypes[0], enemyTypes[1], enemyTypes[2]];
	} else if roomCount > 4 && roomCount <= 10 {
		types =  [enemyTypes[0], enemyTypes[1], enemyTypes[2], enemyTypes[3]];
	} else if roomCount > 10 && roomCount <= 15 {
		types =  [enemyTypes[0], enemyTypes[1], enemyTypes[2], enemyTypes[3], enemyTypes[4]];
	} else if roomCount > 15 && roomCount <= 25 {
		types =  [enemyTypes[0], enemyTypes[1], enemyTypes[2], enemyTypes[3], enemyTypes[4], enemyTypes[5], enemyTypes[6]];
	} else {
		types =  enemyTypes;
	}
	return types;
}

//gets the number of enemies for the encounter
function getCount() {
	var count;
	if roomCount == 0 {
		count = 2;
	} else if roomCount == 1 {
		count = 3;
	} else  if roomCount > 1 && roomCount <= 4 {
		count = irandom_range(2, 5);
	} else if roomCount > 4 && roomCount <= 10 {
		count = irandom_range(5, 15);
	} else if roomCount > 10 && roomCount <= 20 {
		count = irandom_range(15, 20);
	} else {
		count = irandom_range(roomCount, (roomCount*2));
	}
	
	return count;
}


//draws enemies
function setEnemies(count, types) {
	var locX = 0;
	var locY = 10;
	for (var i = 0; i < count; i++) {
		enemy[i] = instance_create_layer(locX*tile_size,locY*tile_size,"Enemies", types[irandom(array_length(types)-1)]);
		locX++;
		if locX == 20 {
			locY++;
		}
		
	}
}

//finds number of walls and draws them
function setWalls() {
	
}

//clears all current walls
function deleteWalls() {
	var layerid = layer_get_id("walls");
	var a = layer_get_all_elements(layerid);

	for (var i = 0; i < array_length_1d(a); i++;) {
	deletme = a[i];
    instance_create_layer(deletme.x,deletme.y,"walls", oWall);
    instance_destroy(deletme);
}

}




