extends Control



func _on_continue_pressed():
	Global.is_paused = false
	self.hide()
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_options_menu_options_closed():
	self.show()
	pass # Replace with function body.


func _on_options_menu_options_open():
	self.hide()
	pass # Replace with function body.
