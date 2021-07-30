// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function togglePlayers(){
	if (global.has2players) {
		//Adjust Panels
		array_set(panel[uiPanel.timeline],2,ui.right);
		array_set(panel[uiPanel.healthbarp1],2,ui.right);
		
		//Toggle Switch
		global.has2players = false
	} else {
		//Adjust Panels
		array_set(panel[uiPanel.timeline],2,array_get(panel[uiPanel.itemslotsp2],0));
		array_set(panel[uiPanel.healthbarp1],2,ui.right/2);
		
		//Toggle Switch
		global.has2players = true;
	}
}