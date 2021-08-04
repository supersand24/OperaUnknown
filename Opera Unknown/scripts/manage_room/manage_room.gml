// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//last_door refers to the last door type choose by the players
//0 is the normal encounter
//1 is good
//2 is bad


//sets all insatnces in the room
function setRoom() {
	randomise();
	//clearRoom();
	moveAllies();
	if (last_door == 0) {
		setWalls(40,75);
	} else if (last_door == 1) {
		setWalls(50,100)
	} else if (last_door == 2) {
		setWalls(10,40);
	}
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
		types = returnType(0, 2);
	}
	
	if (last_door == 0 && roomCount > 0) {
		if roomCount > 0 && roomCount <= 4 {
			types = returnType(0, 3);
		} else if roomCount > 4 && roomCount <= 10 {
			types =  returnType(0, 4);
		} else if roomCount > 10 && roomCount <= 15 {
			types =  returnType(0, 5);
		} else if roomCount > 15 && roomCount <= 25 {
			types =  returnType(0, 7);
		} else {
			types = enemyTypes;
		}
	
	} else if (last_door == 1 && roomCount > 0) {
		if roomCount > 0 && roomCount <= 4 {
			types = returnType(0, 4);
		} else if roomCount > 4 && roomCount <= 10 {
			types =  returnType(3, 7);
		} else if roomCount > 10 && roomCount <= 15 {
			types =  returnType(3,8)
		}
	
	} else if (last_door == 2 && roomCount > 0) {
		if roomCount > 0 && roomCount <= 4 {
			types = returnType(0, 4);
		} else if roomCount > 4 && roomCount <= 10 {
			types =  returnType(0, 6);
		} else if roomCount > 10 && roomCount <= 15 {
			types =  enemyTypes;
		}
	}
	
	return types;
}

//gets the number of enemies for the encounter
function getCount() {
	var count;
	
	if roomCount == 0 {
		count = 4;
	}
	
	if (last_door == 0 && roomCount > 0) {
		if roomCount > 0 && roomCount <= 4 {
			count = irandom_range(4, 7);
		} else if roomCount > 4 && roomCount <= 10 {
			count = irandom_range(8, 15);
		} else if roomCount > 10 && roomCount <= 15 {
			count = irandom_range(15, 25);
		} else if roomCount > 15 && roomCount <= 25 {
			count = irandom_range(25, 40);
		} else {
			count = irandom_range(roomCount, roomCount*2);
			if (count > 100) {
				count = 100;
			}
		}
	
	} else if (last_door == 1 && roomCount > 0) {
		if roomCount > 0 && roomCount <= 4 {
			count = irandom_range(3, 6);
		} else if roomCount > 4 && roomCount <= 10 {
			count = irandom_range(4, 10);
		} else if roomCount > 10 && roomCount <= 15 {
			count = irandom_range(12, 15);
		} else if roomCount > 15 && roomCount <= 25 {
			count = irandom_range(15, 20);
		} else {
			count = irandom_range(roomCount/2, roomCount);
			if count > 100 {
				count = 100
			}	
		}
	
	} else if (last_door == 2 && roomCount > 0) {
		if roomCount > 0 && roomCount <= 4 {
			count = irandom_range(5, 10);
		} else if roomCount > 4 && roomCount <= 10 {
			count = irandom_range(12, 18);
		} else if roomCount > 10 && roomCount <= 15 {
			count = irandom_range(20, 30);
		} else if roomCount > 15 && roomCount <= 25 {
			count = irandom_range(30, 50);
		} else {
			count = irandom_range(roomCount, roomCount*3);
			if count > 100 {
				count = 100
			}	
		}
	}	
	
	return count;
}


//draws enemies randomly in room
function setEnemies(count, types) {
	for (var i = 0; i < count; i++) {
		var locX = irandom_range(2, 20);
		var locY = irandom_range(2, 19);
		if (!place_meeting(locX , locY, all)) {
			enemy[i] = instance_create_layer(locX*tile_size,locY*tile_size,"Enemies", types[irandom(array_length(types)-1)]);
		}
	}
}

//finds number of walls and draws them randomly in room
function setWalls(int1 , int2) {
	for (var i = 0; i < irandom_range(int1, int2+1); i++) {
		var wallX = irandom_range(2, 18);
		var wallY = irandom_range(0, 19);
		if (!place_meeting(wallX , wallY, all)) {
			instance_create_layer(wallX*tile_size,wallY*tile_size,"walls", oWall);
		} else {
			if (int2 < int1) {
				setWalls(int1, int2-10);
			}
		}
	}
}

//clears all current walls and enemies
function clearRoom() {
	instance_destroy(oWall);
	instance_destroy(oEnemyParent);
		

	
	/*will not work if enemy array in use since uiInterfaces cant find the insatnce
	var layerid2 = layer_get_id("Enemies");
	var a = layer_get_all_elements(layerid2);

	for (var i = 0; i < array_length(a); i++;) {
		if (layer_get_element_type(a[i]) == layerelementtype_instance && object_get_parent(a[i]) != oPlayer) {
			//deletme = a[i];
			//instance_create_layer(deletme.x,deletme.y,"Enemies", oWall);
			instance_destroy(a[i]);
		}
	}*/

}

//resets the game to a state of no enemies or walls
//and resets the roomCount to 0
function resetRoom() {
	//clearRoom();
	setRoom();
	roomCount = 0;
	
}

//loops throught the enemytype array so i dont have to retype it so many times
function returnType(a, i) {
	var type = [];
	while (a < i) {
		type[a] = enemyTypes[a];
		a++;
	}
	return type;
}



