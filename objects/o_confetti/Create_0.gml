/// @description Insert description here
// You can write your code in this editor
grav = 0.2;
x_spd = random_range(-8, 8);
y_spd = random_range(-2, - 15);

normalized = 1/sqrt(power(x_spd, 2) + power(y_spd, 2));

x_spd = x_spd * normalized;
y_spd = y_spd * normalized;

strength = random_range(2, 20);

x_spd *= strength;
y_spd *= strength;

rotation = random_range(0, pi*2);
rotation_spd = random_range(2, 10);
lifetime = 0;
image_speed = 0;
image_index = irandom_range(0, 5);