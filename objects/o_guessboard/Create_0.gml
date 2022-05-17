/// @description Insert description here
// You can write your code in this editor
event_inherited();

guesses = [];
current_guess = "";

approved_keys = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

guess_rows = []
row_offset = 76;

y_offset = -40;

for (var i_ = 0; i_ < o_root.max_guess; i_++){
	var row_ = instance_create_layer(o_root.x, (o_root.y + 1000) + (100 * array_length(guess_rows)), "Instances", o_guess_row);
	row_.anchor = self;
	row_.y_offset = (row_offset * (i_ - 3));
	guess_rows[array_length(guess_rows)] = row_;
}


function submit(){
	o_root.correct_in_a_row = 0;
	if (is_in_array(current_guess, o_root.all_english_words)){
		submission_approved();	
	} else {
		submission_denied();	
	}
}

function submission_approved(){
		
	guesses[array_length(guesses)] = current_guess;
	guess_rows[array_length(guesses)-1].submitted = true;
	if (current_guess == o_root.correct_word){
		current_guess = "";
		with(o_root){ game_win();}
		
	} else {
		current_guess = "";
		if(array_length(guesses) > 6)
			with(o_root){ game_lose();}
		}
}
		

function submission_denied(){
	
	// Play Error Sound
	audio_sound_pitch(snd_error, 0.6);
	audio_play_sound(snd_error, 0 ,false); 
		
	with(guess_rows[array_length(guesses)]){
		for(var j_ = 0; j_ < o_root.word_length; j_++){
			with(letters[j_]){
				alarm_set(1, 1);	
			}
		}
	}
}

remove_character = function(){
		if (string_length(current_guess) > 0){
		current_guess = string_delete(current_guess, string_length(current_guess), 1);
		audio_sound_pitch(snd_thud_2, random_range(0.9, 0.85));
		audio_play_sound(snd_thud, 0, false);
	} else {
		with(guess_rows[array_length(guesses)]){
			for(var i_ = 0; i_ < o_root.word_length; i_++){
				letters[i_].image_xscale = letters[i_].target_image_scale * 0.9;
				letters[i_].image_yscale = letters[i_].target_image_scale * 0.9;
			}
		}
		audio_sound_pitch(snd_thud_2, random_range(0.7, 0.75));
		audio_play_sound(snd_thud_2, 0, false);
	}	
}

add_character = function(character){
	
	if (string_length(current_guess) < o_root.word_length && is_in_array(string_upper(character), approved_keys) ){
			current_guess = current_guess + string_upper(character);
			audio_sound_pitch(snd_thud, random_range(1, 1.05));
			audio_play_sound(snd_thud, 0, false);
		} else {
			with(guess_rows[array_length(guesses)]){
				for(var i_ = 0; i_ < o_root.word_length; i_++){
					letters[i_].image_xscale = letters[i_].target_image_scale * 1.1;
					letters[i_].image_yscale = letters[i_].target_image_scale * 1.1;
				}
			}
			audio_sound_pitch(snd_thud, random_range(0.7, 0.74));
			audio_play_sound(snd_thud_2, 0, false);
		}
}

trigger_win = function(){
	
	o_streak.streak += 1/600;
	o_streak.draw_y = o_streak.draw_y + (32/580);
	
	with(o_root){
		alarm_set(0, 60);	
	}	
	
	o_guessboard.lerp_speed = 0.03;
	o_keyboard.lerp_speed = 0.03;
	o_guessboard.y_offset = 1000;
	o_keyboard.y_offset = 1600;

}

trigger_lose = function(){
	
	audio_sound_pitch(snd_lose, 0.9);
	audio_play_sound(snd_lose, 0, false);
	o_streak.streak = 0;
	o_keyboard.y_offset = 1100;
	o_keyboard.lerp_speed = 0.01;
	with(o_root){
		alarm_set(0, 110);	
	}
	
	var i_, j_;
	for (i_ = 0; i_ < array_length(guess_rows); i_++){
		for (j_ = 0; j_ < string_length(o_root.correct_word); j_++){
			with(guess_rows[i_].letters[j_]){
				x = anchor.x + draw_x;
				y = anchor.y + draw_y;
				x_offset = 0;
				y_offset = 0;
				draw_x = 0;
				draw_y = 0;
				anchor = self;	
				lose_fall = true;
				x_spd = random_range(-2, 2);
				y_spd = random_range(-3, -5);
				rotation_speed = random_range(-2, 2);
			}
		}
	}
	
}