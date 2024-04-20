extends Node2D

var next = 0
var audioStreamPlayers = []
@export var count = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.music_volume = -20
	Signalbus.music.connect(_on_music)
	Signalbus.stopmusic.connect(_on_stop_music)
	if get_child_count() == 0:
		print("No AudioStreamPlayer Found")
		return
	var child = get_child(0)
	if child is AudioStreamPlayer2D:
		audioStreamPlayers.append(child)
		for i in range(count):
			var dup = child.duplicate()
			add_child(dup)
			audioStreamPlayers.append(dup)
		pass
	change_music_volume()
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.volume_changed :
		Global.volume_changed = false
		change_music_volume()
	pass
func _get_configuration_warnings():
	var child = get_child(0)
	if get_child_count() == 0:
		var string = "No children found. Expected one AudioStreamPlayer child."
		return string
	if child is AudioStreamPlayer2D:
		pass
	else:
		var string = "Expected first child to be an AudioStreamPlayer."
		return string
	return self._get_configuration_warnings()
func play_sound():
	if !audioStreamPlayers[next].playing:
		next = next +1 
		audioStreamPlayers[next].play()
		
		next %= audioStreamPlayers.size()
func play_music(musicname):
	if musicname == null or musicname == "":
		return "No music selected"
	else:
		var player = get_child(0)
		if player is AudioStreamPlayer2D:
			var getmusic = ResourceLoader.load("res://assets/music/"+musicname+".mp3")
			Global.active_music = musicname
			player.stream = getmusic
			if player.playing == true:
				player.stop()
				player.play()
			else:
				player.play()
	pass
func change_music_volume():
	var player = get_child(0)
	if player is AudioStreamPlayer2D:
		player.volume_db = Global.music_volume
	pass
func change_sound_volume():
	var player = get_child(1)
	if player is AudioStreamPlayer2D:
		player.volume_db = Global.sound_volume
	pass
func stop_music():
	var player = get_child(0)
	if player is AudioStreamPlayer2D:
		if player.playing == true:
			Global.active_music = ""
			player.stop()
		else:
			pass
	pass
func play_soundeffect(soundname):
	var player = get_child(1)
	if player is AudioStreamPlayer2D:
		var getsound = ResourceLoader.load("res://sound/sound/"+soundname+".mp3")
		player.stream = getsound
		if player.playing == true:
			player.stop()
			player.play()
		else:
			player.play()
	pass
func _on_sound(soundname):
	play_soundeffect(soundname)
func _on_music(musicname):
	play_music(musicname)
func _on_stop_music():
	stop_music()


func _on_music_slider_value_changed(value):
	Global.music_volume = value
	change_music_volume()
	pass # Replace with function body.


func _on_sound_slider_value_changed(value):
	Global.sound_volume = value
	change_sound_volume()
	pass # Replace with function body.
