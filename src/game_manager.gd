extends Control
@onready var pause_menu = get_node("../pause_menu")
@onready var options_menu = get_node("../options_menu")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	if Input.is_action_just_pressed("escape"):
		if not Global.is_paused:
			pause_menu.show()
			Global.is_paused = true
		else:
			pause_menu.hide()
			options_menu.hide()
			Global.is_paused = false
	pass
