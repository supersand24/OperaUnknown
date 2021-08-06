// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkArray(arrayName) {
	for (var i = 0; i < array_length(arrayName); i++) {
		if arrayName[i] != undefined {
			return false;
		}
	}
	
	return true;
}