extends Control

func _ready():
	Signalbus.character.connect(_on_character)
	pass

func get_character(character_name) -> Chara:
	var node
	if self.has_node("character_"+character_name.to_lower()):
		node = get_node("character_"+character_name.to_lower())
	else:
		node = create_character(character_name)
	return node
func create_character(character_name) -> Chara:
	var character_node = preload("res://prefabs/character.tscn")
	var instance = character_node.instantiate()
	instance.character_name = character_name
	instance.set_name("character_" +character_name.to_lower()) 
	add_child(instance)
	return instance
func enter(character_name,location,sprite_name = "default",smooth = true):
	var chara = get_character(character_name)
	var sprite = ResourceLoader.load("res://assets/sprites/"+character_name.to_lower()+" "+sprite_name+".png")
	chara.setPosition(location)
	if smooth:
		var tween = get_tree().create_tween()
		chara.modulate.a = 0
		chara.get_child(0).texture = sprite
		tween.tween_property(chara,"modulate:a",1,0.5).set_ease(Tween.EASE_IN_OUT)
		await get_tree().create_timer(0.5).timeout
		tween.kill()
	else:
		chara.get_child(0).texture = sprite
	
func _on_character(array):
	var method_array = array.split(',')
	match method_array[0]:
		"enter":
			enter(method_array[1],method_array[2],method_array[3])
		"expression":
			var chara = get_character(method_array[1])
			chara.setSprite(method_array[1]+" "+method_array[2])
		_:
			pass
	pass
