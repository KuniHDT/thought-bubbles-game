extends Control

@onready var bubble_1 = $Bubble
@onready var bubble_2 = $Bubble2

func display_bubbles(problem_data:Resource):
	var bubble_data = problem_data
	bubble_1.message = bubble_data.bubble1_message
	bubble_1.stat_self = bubble_data.bubble1_self
	bubble_1.stat_family = bubble_data.bubble1_family
	bubble_1.stat_work = bubble_data.bubble1_work
	bubble_1.stat_friends = bubble_data.bubble1_friends
	
	bubble_2.message = bubble_data.bubble2_message
	bubble_2.stat_self = bubble_data.bubble2_self
	bubble_2.stat_family = bubble_data.bubble2_family
	bubble_2.stat_work = bubble_data.bubble2_work
	bubble_2.stat_friends = bubble_data.bubble2_friends

func hide_bubbles(name : String):
	if name == "Bubble":
		bubble_2.tween_hide()
		bubble_1.tween_fly()
	elif name == "Bubble2":
		bubble_1.tween_hide()
		bubble_2.tween_fly()
