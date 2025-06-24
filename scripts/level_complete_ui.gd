extends CanvasLayer

@onready var level_complete_panel: Panel = $levelCompletePanel
@onready var level_complete_label: Label = $levelCompletePanel/levelCompleteLabel


func show_game_complete_screen(text: String = ""):
	level_complete_panel.visible = true
	if text != "":
		level_complete_label.text = text
	


func remove_game_complete_screen():
	level_complete_label.text = "So?"
	level_complete_panel.visible = false
	
