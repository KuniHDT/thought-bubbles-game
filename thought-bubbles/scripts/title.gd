extends Node2D

@onready var main_scene : PackedScene = preload("res://scenes/main.tscn")

func _init():
	TranslationServer.set_locale("vi")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(main_scene)

func _on_button_2_pressed() -> void:
	get_tree().quit()

func _on_check_box_toggled(toggled_on: bool) -> void:
	Globals.time_attack = toggled_on
