extends Control

@onready var status_1_bar = $PanelContainer/MarginContainer/HBoxContainer/Status/Bar
@onready var status_2_bar = $PanelContainer/MarginContainer/HBoxContainer/Status2/Bar
@onready var status_3_bar = $PanelContainer/MarginContainer/HBoxContainer/Status3/Bar
@onready var status_4_bar = $PanelContainer/MarginContainer/HBoxContainer/Status4/Bar

func _ready():
	#status_1_bar.show_percentage = false
	#status_2_bar.show_percentage = false
	#status_3_bar.show_percentage = false
	pass

func _process(delta: float) -> void:
	status_1_bar.value = Globals.stat_self
	status_2_bar.value = Globals.stat_family
	status_3_bar.value = Globals.stat_work
	status_4_bar.value = Globals.stat_friends
