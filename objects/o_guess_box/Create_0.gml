/// @description Insert description here
// You can write your code in this editor
event_inherited();

reveal_curve = animcurve_get_channel(curve_letter, "curve_reveal_letter");
error_curve = animcurve_get_channel(curve_letter, "curve_error");
active_curve = reveal_curve;

curve_percentage = 0.0;

reveal = false;

curve_x = 0;
curve_y = 0;
curve_reveal_amp = 10;
error_curve_amp = 10;
active_curve_amp = curve_reveal_amp;
reveal_draw = 0.0;
lose_fall = false;

curve_reveal_speed = 0.04;
error_curve_speed = 0.04;
active_curve_speed = curve_reveal_speed;
wrong = false;
play_sound = true;

image_speed = 0;
display_style = 0;
letter = 0;
previous_letter = letter;

grav = 0.3;
rotation = 0;
rotation_speed = 0.2;