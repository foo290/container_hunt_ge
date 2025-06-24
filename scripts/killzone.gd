extends Area2D

@onready var game_reload_timer: Timer = $game_reload_timer
@onready var game_manager: Node = $"../GameManager"


func _on_body_entered(body: Node2D) -> void:
	print("body entered")
	var gm = get_node("/root/Game/GameManager")
	gm.game_over(body)
	
	#game_reload_timer.start()


func _on_game_reload_timer_timeout() -> void:
	pass
	
