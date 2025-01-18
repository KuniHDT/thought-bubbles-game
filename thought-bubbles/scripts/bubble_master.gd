extends Control

@onready var bubble_1 = $Bubble

@export var event_data:Resource

func _on_dialogue_label_message_finished() -> void:
	display_bubbles()
	
func display_bubbles():
	pass

func hide_bubbles():
	pass
