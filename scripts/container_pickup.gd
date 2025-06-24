extends Area2D
@onready var game_manager: Node = $"../../GameManager"

# use signals to detect

func _on_body_entered(body: Node2D) -> void:
	print("picked up 1 container")
	game_manager.update_score()
	#print(score_text)
	queue_free()


func _ready() -> void:
	add_to_group("containers")
	
	var total_containers = get_tree().get_nodes_in_group("containers").size()
	game_manager.total_containers = total_containers
