/// @description Insert description here
// You can write your code in this editor



draw_x = lerp(draw_x, x_offset, lerp_speed);
draw_y = lerp(draw_y, y_offset, lerp_speed);

x = anchor.x + draw_x;
y = anchor.y + draw_y;

image_xscale = lerp(image_xscale, target_image_scale, lerp_speed);
image_yscale = lerp(image_yscale, target_image_scale, lerp_speed);