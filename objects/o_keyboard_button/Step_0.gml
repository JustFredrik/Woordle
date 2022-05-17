/// @description Insert description here
// You can write your code in this editor
event_inherited();

reveal_draw = clamp(reveal_draw + 0.04, 0, 1) * reveal;

if ((array_length(o_guessboard.guesses) > 0) && o_guessboard.guesses[array_length(o_guessboard.guesses)-1] == o_root.correct_word){
	exit;	
}

if (array_length(o_guessboard.guesses) >= o_root.max_guess){
	exit;	
}

if (hover){
	
	target_image_scale = 1.05;
	if mouse_check_button_pressed(mb_left){
		click_progress = 1;	
	} else if (!mouse_check_button(mb_left) && click_progress >= 1) {
		action();
		click_progress = 0;
	}
	
	if (click_progress == 1){
		target_image_scale = 0.95;	
	}
		
} else {
	click_progress = 0;
	target_image_scale = 1;
}
