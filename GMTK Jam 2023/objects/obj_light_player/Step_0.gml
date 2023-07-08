
if (host != noone) {
	
	light[| eLight.Intensity] = 1.;
	
	light[| eLight.Range] = wave(600, 650, 20, 0);

	x = host.x;
	y = host.y-16;
	
	//Update light position
	light[| eLight.X] = x;
	light[| eLight.Y] = y;
	
}