extends Node2D

@onready var dialogue = $CanvasLayer/VBoxContainer/DialogueBox/MarginContainer/DialogueLabel
@onready var character_name = $CanvasLayer/VBoxContainer/HBoxContainer/CharacterName/MarginContainer/Label
@onready var bubbles = $CanvasLayer/Bubbles

@export var problem_data : Resource

var problems = []

func _init():
	TranslationServer.set_locale("vi")

func _ready():
	problems.append(load("res://scenes/content/EVENT_AUNT.tres"))
	problems.append(load("res://scenes/content/EVENT_BOSS.tres"))
	problems.append(load("res://scenes/content/EVENT_CLIENT.tres"))
	problems.append(load("res://scenes/content/EVENT_CLOSE_FRIEND.tres"))
	problems.append(load("res://scenes/content/EVENT_COLLEAGUE.tres"))
	problems.append(load("res://scenes/content/EVENT_DAD.tres"))
	problems.append(load("res://scenes/content/EVENT_DRIVER.tres"))
	problems.append(load("res://scenes/content/EVENT_GRANDMA.tres"))
	problems.append(load("res://scenes/content/EVENT_LOVER.tres"))
	problems.append(load("res://scenes/content/EVENT_MOM.tres"))
	problems.append(load("res://scenes/content/EVENT_SISTER.tres"))
	problems.append(load("res://scenes/content/EVENT_SPORT_FRIEND.tres"))
	problems.append(load("res://scenes/content/EVENT_UNCLE.tres"))
	problems.append(load("res://scenes/content/EVENT_UNI_FRIEND.tres"))
	
	problems.shuffle()
	
	print(problems)
	
	$AnimationPlayer.play("initial_start")
	
func start_problem():
	problem_data = problems[0]
	dialogue.start_dialogue(problem_data)
	bubbles.visible = true
	$AnimationPlayer.play("display_bubbles")
	bubbles.display_bubbles(problem_data)
	dialogue.messages[dialogue.message_id] = problem_data.problem
	character_name.text = problem_data.person

func next_problem():
	if Globals.game_over == true:
		return
	problem_data = problems[dialogue.message_id + 1]
	dialogue.next_message(problem_data)
	$AnimationPlayer.play("display_bubbles")
	bubbles.display_bubbles(problem_data)
	character_name.text = problem_data.person
	$CanvasLayer/Bubbles/Bubble.disabled = false
	$CanvasLayer/Bubbles/Bubble2.disabled = false
	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "initial_start":
		Globals.game_started = true
		Globals.stat_self = 3
		Globals.stat_family = 3
		Globals.stat_work = 3
		Globals.stat_friends = 3
		MusicManager.play("bgm", "theme")
		start_problem()

func game_over(type : String):
	var game_over_text = $CanvasLayer/GameOverScreen/VBoxContainer/Label
	match type:
		"self":
			game_over_text.text = "ENDING_SELF"
		"family":
			game_over_text.text = "ENDING_FAMILY"
		"work":
			game_over_text.text = "ENDING_WORK"
		"friends":
			game_over_text.text = "ENDING_FRIEND"
	$AnimationPlayer.play("game_over")
	MusicManager.play("bgm", "game_over", 0.25)
	Globals.game_over = true

func _on_dialogue_label_message_finished() -> void:
	pass
