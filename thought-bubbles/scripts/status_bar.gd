extends Control

@onready var status_1 = $PanelContainer/HBoxContainer/Status
@onready var status_1_bar = $PanelContainer/HBoxContainer/Status/Bar
@onready var status_2 = $PanelContainer/HBoxContainer/Status2
@onready var status_2_bar = $PanelContainer/HBoxContainer/Status2/Bar
@onready var status_3 = $PanelContainer/HBoxContainer/Status3
@onready var status_3_bar = $PanelContainer/HBoxContainer/Status3/Bar
@onready var status_4 = $PanelContainer/HBoxContainer/Status4
@onready var status_4_bar = $PanelContainer/HBoxContainer/Status4/Bar

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
