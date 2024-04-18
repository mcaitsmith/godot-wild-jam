extends Control

signal options_closed
signal options_open


func _on_close_pressed():
	self.hide()
	options_closed.emit()
	pass # Replace with function body.


func _on_options_pressed():
	self.show()
	options_open.emit()
	pass # Replace with function body.
