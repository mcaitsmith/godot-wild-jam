extends Control
class_name Chara
var character_name

func getPosition(location):
	var position_vector
	match location.to_lower():
		"center":
			position_vector = Global.center
		"right":
			position_vector = Global.right
		"left":
			position_vector = Global.left
		_:
			pass
	return position_vector
func setPosition(location):
	var position_vector = getPosition(location)
	self.position = position_vector
	pass
func move(location,smooth = true,duration = 0.5):
	var position_vector = getPosition(location)
	var tween = get_tree().create_tween()
	tween.tween_property(self,"position",position_vector,duration).set_ease(Tween.EASE_IN_OUT)
	await get_tree().create_timer(duration).timeout
	tween.kill()
func setSprite(sprite_name,smooth = true,duration = 0.5):
	var spritenode = get_child(0)
	var sprite = ResourceLoader.load("res://assets/sprites/"+sprite_name+".png")
	if smooth:
		var tween = get_tree().create_tween()
		var dup = spritenode.duplicate()
		dup.modulate.a = 0
		dup.texture = sprite
		add_child(dup)
		move_child(dup,1)
		tween.tween_property(dup,"modulate:a",1,duration).set_ease(Tween.EASE_IN_OUT)
		await get_tree().create_timer(duration).timeout
		spritenode.texture = sprite
		dup.queue_free()
	else:
		spritenode.texture = sprite
	pass
func kill():
	queue_free()
	pass
