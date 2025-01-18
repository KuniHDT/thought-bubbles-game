extends Node2D

@onready var dialogue = $CanvasLayer/DialogueBox/DialogueLabel

func start_problem():
	dialogue.start_dialogue()

func next_problem():
	dialogue.next_message()
