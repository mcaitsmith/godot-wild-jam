extends Control

var main_game = preload("res://scenes/game.tscn")

func _on_start_button_pressed():
	get_tree().change_scene_to_packed(main_game)
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.
func _on_options_button_pressed():
	# Place holder for options menu
	var options = $options_menu
	options.show()
	pass # Replace with function body.
