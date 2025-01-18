extends Control

var message : String
var stat1 : int
var stat2 : int
var stat3 : int

func _process(delta: float) -> void:
	if message == null:
		return
	else:
		$RichTextLabel.text = message

func tween_hide():
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 0.5)

func tween_fly():
	var tween = create_tween()
	tween.tween_property(self, "position", self.position - Vector2(0, 130), 1)
	tween.set_parallel()
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 1)

func _on_mouse_entered() -> void:
	pass # Replace with function body.

func _on_mouse_exited() -> void:
	pass # Replace with function body.

func _on_pressed() -> void:
	print("Button pressed.")
	Globals.stat1 += stat1
	Globals.stat2 += stat2
	Globals.stat3 += stat3
	get_parent().hide_bubbles(self.name)
	await get_tree().create_timer(2).timeout
	get_tree().current_scene.next_problem()
