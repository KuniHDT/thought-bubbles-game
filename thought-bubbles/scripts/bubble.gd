extends Control

var message : String
var stat_self : int
var stat_family : int
var stat_work : int
var stat_friends : int

var noise = FastNoiseLite.new()
var amplitude = 0.2
var frequency = 10.0
var speed = 0.3

func _ready():
	randomize()
	noise.seed = randi()

func _process(delta: float) -> void:
	if message == null:
		return
	else:
		$RichTextLabel.text = message
		
	
	var t = Time.get_ticks_msec() / 1000.0
	position.x = lerp(position.x, position.x + noise.get_noise_2d(t * frequency, 0) * amplitude, speed)
	position.y = lerp(position.y, position.y + noise.get_noise_2d(t * frequency, 1) * amplitude, speed)

func tween_hide():
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 0.5)
	SoundManager.play("sfx", "pop")

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
	self.disabled = true
	Globals.stat_self += stat_self
	Globals.stat_family += stat_family
	Globals.stat_work += stat_work
	Globals.stat_friends += stat_friends
	get_parent().hide_bubbles(self.name)
	await get_tree().create_timer(2).timeout
	get_tree().current_scene.next_problem()
	
