extends CanvasLayer

@onready var score_label: Label = $ScoreLabel


func update_score_ui(score: int, prefix: String = "Container Count:"):
	score_label.text = prefix + " " + str(score)
