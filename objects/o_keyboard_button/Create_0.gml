/// @description Insert description here
// You can write your code in this editor
event_inherited();


key = "";
hover = false;
click_progress = 0;
display_style = 0;
reveal = false;
reveal_draw = 0;

action = function(){
	
}

virtual_keyboard_letter = function(){
	o_guessboard.add_character(key);
}

virtual_keyboard_submit = function(){
	with(o_guessboard){
		submit();
	}
}

virtual_keyboard_backspace = function(){
	o_guessboard.remove_character();
}

image_speed = 0;