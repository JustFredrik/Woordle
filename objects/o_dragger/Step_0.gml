/// @description Insert description here
// You can write your code in this editor


if (drag){
	window_set_position(display_mouse_get_x()-relative_mouse_pos_x, display_mouse_get_y()-relative_mouse_pos_y);	
}

if mouse_over && mouse_check_button_pressed(mb_left){
	
	relative_mouse_pos_x = window_mouse_get_x();
	relative_mouse_pos_y = window_mouse_get_y();	
	drag = true;
}

if not mouse_check_button(mb_left){
	drag = false;
}

if (mouse_over or drag){
	hover_color = lerp(hover_color, 0.5, color_lerp);	
} else {
	hover_color = lerp(hover_color, 0, color_lerp);	
}

image_xscale = lerp(image_xscale, target_image_scale, 0.05);
image_yscale = lerp(image_yscale, target_image_scale, 0.05);