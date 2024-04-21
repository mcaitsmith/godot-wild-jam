extends Control

@onready var dialogue_box = $DialogueBox
@onready var audio_player = $AudioStreamPlayer

func _ready():
	# connect to the char_displayed signal which is emitted everytime a character is displayed in the dialoguebox
	dialogue_box.custom_effects[0].char_displayed.connect(_on_char_displayed)
	_on_button_pressed()


func _on_button_pressed():
	dialogue_box.start()

#func _on_dialogue_signal(value):
	
func _on_char_displayed(idx):
	# you can use the idx parameter to check the index of the character displayed
	
	# we'll just play an AudioStreamPlayer for this example
	audio_player.play()


func _on_dialogue_box_dialogue_signal(value):
	var signal_array = value.split("_")
	match signal_array[0]:
		"background":
			Signalbus.background.emit(signal_array[1])
		"foreground":
			Signalbus.foreground.emit(signal_array[1])
		"character":
			Signalbus.character.emit(signal_array[1])
		"music":
			Signalbus.music.emit(signal_array[1])
		"sound":
			Signalbus.sound.emit(signal_array[1])
		"stopmusic":
			Signalbus.stopmusic.emit()
	#match(value):
		#'explode': explode()
	pass # Replace with function body.


func _on_dialogue_box_dialogue_ended():
	# fade out the music
	Signalbus.stopmusic.emit()
	
	get_tree().change_scene_to_file("res://scenes/title.tscn")
	pass # Replace with function body.
