extends Node2D

@onready var dialogue = $CanvasLayer/DialogueBox/DialogueLabel

@onready var bubbles = $CanvasLayer/Bubbles

@export var problem_data : Resource

func _ready():
	$AnimationPlayer.play("initial_start")

func start_problem():
	dialogue.start_dialogue()
	bubbles.visible = true
	$AnimationPlayer.play("display_bubbles")
	problem_data = load("res://scenes/content/001.tres")
	bubbles.display_bubbles(problem_data)

func next_problem():
	dialogue.next_message()
	match dialogue.message_id:
		0:
			problem_data.load("res://scenes/content/001.tres")
		1:
			pass
	$AnimationPlayer.play("display_bubbles")
	bubbles.display_bubbles(problem_data)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "initial_start":
		Globals.stat1 = 5
		Globals.stat2 = 5
		Globals.stat3 = 5
