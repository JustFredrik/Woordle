/// @description Insert description here
// You can write your code in this editor

if (mouse_over){
	
	hover_color = lerp(hover_color, 0.5, color_lerp);	
	
	if mouse_check_button_pressed(mb_left){
		action_step = 1;
	}
	
	if ( (action_step == 1) and mouse_check_button_released(mb_left) ){
		script_execute(action);
	}
} else {
	hover_color = lerp(hover_color, 0, color_lerp);	
	action_step = 0;
}


image_xscale = lerp(image_xscale, target_image_scale, 0.05);
image_yscale = lerp(image_yscale, target_image_scale, 0.05);

