class_name Bubble
extends Control

var key : String
var stat1 : int
var stat2 : int
var stat3 : int

func _process(delta: float) -> void:
	$Button.text = key

func _on_button_mouse_entered() -> void:
	pass

func _on_button_mouse_exited() -> void:
	pass # Replace with function body.

func _on_button_pressed() -> void:
	Globals.stat1 + stat1
	Globals.stat2 + stat2
	Globals.stat3 + stat3
