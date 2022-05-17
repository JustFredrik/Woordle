/// @description Insert description here
// You can write your code in this editor
y_spd += grav;
rotation += rotation_spd;
x_spd = lerp(x_spd, 0, 0.0001);
lifetime++;

x += x_spd;
y += y_spd;