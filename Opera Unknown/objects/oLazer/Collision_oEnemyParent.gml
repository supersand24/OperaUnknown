/// @description Destroy Self
bullets--;
other.hp -= dmg;
if (bullets <= 0) {
	instance_destroy();
	with (controller.ally[user]) useTurn();
	//with (controller.enemy[user]) useTurn();
} else {
	x = startX;
	y = startY;
}