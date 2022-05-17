/// @description Insert description here
// You can write your code in this editor
event_inherited();

keyboard_layout = get_english_keyboard_layout();

row_0 = [];
row_1 = [];
row_2 = [];

row_offset = 74;
key_offset = 54;
wide_offset = 10;
x_offset = 0;
y_offset = 285;

var button_;
var i_ = 0;



// Configure Top Row ----------------------------
for (i_ = 0; i_ < array_length(keyboard_layout[0]); i_++){
	button_ = instance_create_layer(x,y,"Instances", o_keyboard_button);
	button_.action = button_.virtual_keyboard_letter;
	button_.key = keyboard_layout[0][i_];
	
	button_.x_offset = (key_offset * i_) - ((key_offset * (array_length(keyboard_layout[0])-1))/2);
	
	button_.y_offset = -row_offset;
	button_.anchor = self;
	row_0[array_length(row_0)] = button_;

}

// Configure Mid Row ----------------------------
for (i_ = 0; i_ < array_length(keyboard_layout[1]); i_++){
	button_ = instance_create_layer(x,y,"Instances", o_keyboard_button);
	button_.action = button_.virtual_keyboard_letter;
	button_.key = keyboard_layout[1][i_];
	
	button_.x_offset = key_offset * i_ - ((key_offset * (array_length(keyboard_layout[1])-1))/2);
	
	button_.anchor = self;
	row_1[array_length(row_1)] = button_;

}

// Configure Bottom Row -------------------------
// Submit Key
button_ = instance_create_layer(x,y,"Instances", o_keyboard_button);
button_.action = button_.virtual_keyboard_submit;
button_.key = undefined;
button_.x_offset = -2 - wide_offset - key_offset - ((key_offset * (array_length(keyboard_layout[2])-1))/2);
button_.y_offset = row_offset;
button_.anchor = self;
button_.sprite_index = spr_keyboard_wide;
row_2[0] = button_;

//The regular keys
for (i_ = 0; i_ < array_length(keyboard_layout[2]); i_++){
	button_ = instance_create_layer(x,y,"Instances", o_keyboard_button);
	button_.action = button_.virtual_keyboard_letter;
	button_.key = keyboard_layout[2][i_];
	
	button_.x_offset = key_offset * i_-1 - ((key_offset * (array_length(keyboard_layout[2])-1))/2);
	
	button_.y_offset = row_offset;
	button_.anchor = self;
	row_2[array_length(row_2)] = button_;

}

// Backspace Key
button_ = instance_create_layer(x,y,"Instances", o_keyboard_button);
button_.action = button_.virtual_keyboard_backspace;
button_.key = undefined;
button_.x_offset = -1 + wide_offset + key_offset + ((key_offset * (array_length(keyboard_layout[2])-1))/2);
button_.y_offset = row_offset;
button_.anchor = self;
button_.sprite_index = spr_keyboard_wide;
row_2[array_length(row_2)] = button_;


update_keyboard_colors = function(key, display_style){
	var i_;
	
	for (i_ = 0; i_ < array_length(keyboard_layout[0]); i_++){
		if (keyboard_layout[0][i_] == key){
			row_0[i_].reveal = true;
			row_0[i_].display_style = (display_style > row_0[i_].display_style) ? display_style : row_0[i_].display_style;
		}
	}
	
	for (i_ = 0; i_ < array_length(keyboard_layout[1]); i_++){
		if (keyboard_layout[1][i_] == key){
			row_1[i_].reveal = true;
			row_1[i_].display_style = (display_style > row_1[i_].display_style) ? display_style : row_1[i_].display_style;
		}
	}
	
	for (i_ = 0; i_ < array_length(keyboard_layout[2]); i_++){
		if (keyboard_layout[2][i_] == key){
			row_2[i_+1].reveal = true;
			row_2[i_+1].display_style = (display_style > row_2[i_+1].display_style) ? display_style : row_2[i_+1].display_style;
		}
	}
}