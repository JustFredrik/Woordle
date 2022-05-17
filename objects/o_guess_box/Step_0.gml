/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Rescale on Mouse Hover currently disabled
if  false && (x-36 < mouse_x) && (mouse_x < x+36) && (y-36 < mouse_y) && ( mouse_y < y+36){
	image_xscale = target_image_scale * 1.02;
	image_yscale = target_image_scale * 1.02;	
}

x = anchor.x + draw_x + curve_x;
y = anchor.y + draw_y + curve_y;

if (reveal && curve_percentage < 1){

	if (curve_percentage >= 0.3){
		
		if (play_sound){
			play_sound = false;
			if (display_style > 1){
				o_root.correct_in_a_row++;
			} else {
				o_root.correct_in_a_row = 0;
			}
			audio_sound_pitch(snd_pop, 0.6 + o_root.correct_in_a_row * 0.1);
			audio_play_sound(snd_pop,0,false);
		}
		reveal_draw = clamp(reveal_draw + active_curve_speed*3, 0, 1);
	}
	curve_percentage += active_curve_speed;
	curve_y = active_curve_amp * animcurve_channel_evaluate(active_curve, curve_percentage);
}

if(wrong){
	
	curve_percentage += active_curve_speed;
	curve_x = active_curve_amp * animcurve_channel_evaluate(active_curve, curve_percentage);

	if (curve_percentage > 1){
		wrong = false;
		curve_percentage = 0;
	}
}

if (previous_letter != letter){
	previous_letter = letter;
	
	if (letter == 26){
		image_xscale = target_image_scale * 0.9;
		image_yscale = target_image_scale * 0.9;
	} else {
		image_xscale = target_image_scale * 1.1;
		image_yscale = target_image_scale * 1.1;
	}
}

if (lose_fall){
	rotation += rotation_speed;
	y_spd += grav;
	x_spd = lerp(x_spd, 0, 0.01);
	x+= x_spd;
	y+= y_spd;
	
}