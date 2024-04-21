extends Control

var main_game = preload("res://scenes/game.tscn")
var click_sound = preload("res://assets/music/click1.ogg")
var rollover_sound = preload("res://assets/music/rollover5.ogg")

var click = AudioStreamPlayer.new()
var rollover = AudioStreamPlayer.new()

func _ready():
	add_child(click)
	add_child(rollover)
	click.stream = click_sound
	rollover.stream = rollover_sound
	click.volume_db = Global.sound_volume - 20.0
	rollover.volume_db = Global.sound_volume - 20.0
	$AudioStreamPlayer2D.volume_db = Global.music_volume - 5.0
	$AudioStreamPlayer2D.play()
	
func _on_start_button_pressed():
	click.play()
	$BlackScreen/TransitionPlayer.play('transition')
	#get_tree().change_scene_to_packed(main_game)
	pass # Replace with function body.

func change_to_game_scene():
	get_tree().change_scene_to_packed(main_game)

func _on_quit_button_pressed():
	click.play()
	get_tree().quit()
	pass # Replace with function body.

func _on_options_button_pressed():
	click.play()
	# Place holder for options menu
	var options = $options_menu
	options.show()
	pass # Replace with function body.

func _on_start_button_mouse_entered():
	rollover.play()
	$StartButton.scale = Vector2(1.1, 1.1)
	pass # Replace with function body.


func _on_start_button_mouse_exited():
	$StartButton.scale = Vector2(1, 1)
	pass # Replace with function body.


func _on_options_button_mouse_entered():
	rollover.play()
	$OptionsButton.scale = Vector2(1.1, 1.1)
	pass # Replace with function body.


func _on_options_button_mouse_exited():
	$OptionsButton.scale = Vector2(1, 1)
	pass # Replace with function body.


func _on_quit_button_mouse_entered():
	rollover.play()
	$QuitButton.scale = Vector2(1.1, 1.1)
	pass # Replace with function body.


func _on_quit_button_mouse_exited():
	$QuitButton.scale = Vector2(1, 1)
	pass # Replace with function body.


func _on_sound_slider_value_changed(value):
	Global.sound_volume = value
	click.volume_db = value
	rollover.volume_db = value
	pass # Replace with function body.


func _on_music_slider_value_changed(value):
	Global.music_volume = value
	$AudioStreamPlayer2D.volume_db = value
	pass # Replace with function body.
