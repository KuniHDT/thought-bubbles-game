extends Control

@onready var bubble_1 = $Bubble
@onready var bubble_2 = $Bubble2

func display_bubbles(problem_data:Resource):
	var bubble_data = problem_data
	bubble_1.message = bubble_data.bubble1_message
	bubble_1.stat1 = bubble_data.bubble1_stat1
	bubble_1.stat2 = bubble_data.bubble1_stat2
	bubble_1.stat3 = bubble_data.bubble1_stat3
	
	bubble_2.message = bubble_data.bubble2_message
	bubble_2.stat1 = bubble_data.bubble2_stat1
	bubble_2.stat2 = bubble_data.bubble2_stat2
	bubble_2.stat3 = bubble_data.bubble2_stat3

func hide_bubbles(name : String):
	if name == "Bubble":
		bubble_2.tween_hide()
		bubble_1.tween_fly()
	elif name == "Bubble2":
		bubble_1.tween_hide()
		bubble_2.tween_fly()
