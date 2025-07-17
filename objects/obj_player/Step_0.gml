/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 26EFC67D
/// @DnDComment : Original (no gamepad support) method$(13_10)$(13_10)1 would be pressing right$(13_10)-1 would be pressing Left$(13_10)0 would be no input.
/// @DnDArgument : "expr" "keyboard_check(vk_right) - keyboard_check(vk_left)"
/// @DnDArgument : "var" "move_x"
move_x = keyboard_check(vk_right) - keyboard_check(vk_left);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4AF86D23
/// @DnDArgument : "expr" "move_x*walk_speed"
/// @DnDArgument : "var" "move_x"
move_x = move_x*walk_speed;

/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
/// @DnDVersion : 1
/// @DnDHash : 0BC659D5
/// @DnDArgument : "msg" "move_x"
show_debug_message(string(move_x));

/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 5535D345
/// @DnDComment : If we are on the Ground
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "2"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "object" "obj_floor"
/// @DnDSaveInfo : "object" "obj_floor"
var l5535D345_0 = instance_place(x + 0, y + 2, [obj_floor]);if ((l5535D345_0 > 0)){	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4CA9E8BF
	/// @DnDComment : reset y movement
	/// @DnDParent : 5535D345
	/// @DnDArgument : "var" "move_y"
	move_y = 0;

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
	/// @DnDVersion : 1
	/// @DnDHash : 04CF6C32
	/// @DnDParent : 5535D345
	var l04CF6C32_0;l04CF6C32_0 = keyboard_check_pressed(vk_space);if (l04CF6C32_0){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3BDD4F36
		/// @DnDComment : Jump!
		/// @DnDParent : 04CF6C32
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "move_y"
		move_y = -jump_speed;}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 6112C92F
	/// @DnDComment : if you're not on the ground
	/// @DnDParent : 5535D345
	else{	/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4A76E91C
		/// @DnDParent : 6112C92F
		/// @DnDArgument : "var" "move_y"
		/// @DnDArgument : "op" "1"
		/// @DnDArgument : "value" "10"
		if(move_y < 10){	/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 0C388467
			/// @DnDComment : add gravity
			/// @DnDParent : 4A76E91C
			/// @DnDArgument : "expr" "1"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "move_y"
			move_y += 1;}}

	/// @DnDAction : YoYo Games.Movement.move_and_collide
	/// @DnDVersion : 1
	/// @DnDHash : 7C5E2534
	/// @DnDComment : 1st object is the object to avoid
	/// @DnDParent : 5535D345
	/// @DnDArgument : "xvel" "move_x"
	/// @DnDArgument : "yvel" "move_y"
	/// @DnDArgument : "maxxmove" "walk_speed"
	/// @DnDArgument : "maxymove" "walk_speed"
	/// @DnDArgument : "object" "obj_floor"
	/// @DnDSaveInfo : "object" "obj_floor"
	move_and_collide(move_x, move_y, obj_floor,4,0,0,walk_speed,walk_speed);}