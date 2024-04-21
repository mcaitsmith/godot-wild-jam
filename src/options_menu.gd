extends Control

signal options_closed
signal options_open


func _on_close_pressed():
	self.hide()
	options_closed.emit()
	pass # Replace with function body.


func _on_options_pressed():
	self.show()
	self.get_child(0).get_child(0).get_child(0).get_child(0).get_child(1).value = Global.music_volume
	self.get_child(0).get_child(0).get_child(0).get_child(1).get_child(1).value = Global.sound_volume
	options_open.emit()
	pass # Replace with function body.
