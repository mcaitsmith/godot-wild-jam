extends Node
var active_characters = []
var game_name = ""
var gfloat= 1
var is_paused = false
var music_volume = 0
var sound_volume = 0
var volume_changed = false
var active_music 
@onready var right = Vector2((gfloat)*1200,0)
@onready var center = Vector2((gfloat)*650,0)
@onready var left = Vector2((gfloat)*100,0)
@onready var left_out = Vector2((gfloat)*-500,0)
@onready var right_out = Vector2((gfloat)*2500,0)

#global functions
func parse(temp):
	var parsedarray = []
	var completed = false
	while !completed:
		temp = temp.lstrip(" ").rstrip(" ")
		var substr = temp.substr(0,temp.find(")")+1)
		parsedarray.append(parse_one(substr))
		temp = temp.erase(0,temp.find(")")+1)
		if !temp.contains(")"):
			completed=true
	return parsedarray
func parse_one(temp):
	var temparray = []
	var _str =""
	for i in range(temp.find("(")):
		_str += temp[i]
	temparray.append(_str)
	_str = ""
	for i in range(temp.find("(")+1,temp.find(")")):
		_str += temp[i]
	temparray.append(_str)
	_str = ""
	return temparray
