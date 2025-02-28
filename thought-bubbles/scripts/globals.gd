extends Node

var time_attack : bool
var game_started : bool
var game_over : bool

var stat_self : int
var stat_family : int
var stat_work : int
var stat_friends : int

func _process(delta: float) -> void:
	
	if game_started == false:
		return
	
	if game_over == true:
		return
	
	if stat_self <= 0:
		get_tree().current_scene.game_over("self") 
	elif stat_family <= 0:
		get_tree().current_scene.game_over("family")
	elif stat_work <= 0:
		get_tree().current_scene.game_over("work")
	elif stat_friends <= 0:
		get_tree().current_scene.game_over("friends")
	
	if stat_self > 6:
		stat_self = 6
	elif stat_family > 6:
		stat_family = 6
	elif stat_work > 6:
		stat_work = 6
	elif stat_friends > 6:
		stat_friends = 6
