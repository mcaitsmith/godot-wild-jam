extends Control

@onready var background = get_node("../background")
@onready var foreground = get_node("../foreground")
func _ready():
	Signalbus.background.connect(_on_background)
func set_background(image,smooth = true):
	var texture_image = ResourceLoader.load("res://assets/backgrounds/"+image+".png")
	if smooth:
		transition(background,texture_image)
	else:
		background.get_child(0).texture = texture_image
	pass
func set_foreground(image,smooth = true):
	var texture_image = ResourceLoader.load("res://assets/backgrounds/"+image+".png")
	if smooth:
		transition(foreground,texture_image)
	else:
		foreground.get_child(0).texture = texture_image
	pass
func transition(node : Node,image,duration = 0.5):
	var imagenode = node.get_child(0)
	var dup = imagenode.duplicate()
	dup.modulate.a = 0
	dup.texture = image
	node.add_child(dup)
	var tween = get_tree().create_tween()
	tween.tween_property(dup,"modulate:a",1,duration).set_ease(Tween.EASE_IN_OUT)
	await get_tree().create_timer(duration).timeout
	imagenode.texture = image
	dup.queue_free()
func _on_background(backgroundname):
	set_background(backgroundname)
func _on_foreground(foregroundname):
	set_foreground(foregroundname)
