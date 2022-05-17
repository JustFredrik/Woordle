/// @description Insert description here
// You can write your code in this editor

repeat(600){
	instance_create_layer(o_root.x, room_height + 70, "Instances", o_confetti);	
	o_logo.lerp_speed = 0.05;
	o_logo.image_xscale = o_logo.target_image_scale * 1.1;
	o_logo.image_yscale = o_logo.target_image_scale * 1.1;

	audio_sound_pitch(snd_win, 0.9);
	audio_play_sound(snd_win, 0, false);
	o_guessboard.trigger_win();
}