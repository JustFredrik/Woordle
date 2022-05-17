/// @description Insert description here
// You can write your code in this editor
event_inherited();

word = "";
previous_word = word;
letters = []
letter_offset = 76;
reveal_time_offset = 22;
submitted = false;


for (var i_ = 0; i_ < o_root.word_length; i_++){
	var letter_ = instance_create_layer(x,y,"Instances",o_guess_box);
	letter_.anchor = self;
	letter_.x_offset = (i_ - 2) * letter_offset;
	letters[array_length(letters)] = letter_;
}

