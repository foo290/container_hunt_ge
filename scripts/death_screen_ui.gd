extends CanvasLayer

@onready var death_screen_panel: Panel = $deathScreenPanel


func show_death_screen():
	death_screen_panel.visible = true
	

func remove_death_panel():
	death_screen_panel.visible = false
