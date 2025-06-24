extends Node

var score = 0
var previous_score = 0
var total_containers = 0

const SLEEP_ON_DEAD = 5  # in seconds

@onready var start_label: Label = $"../StartLabel"
@onready var score_ui: CanvasLayer = $"../UIElements/scoreUI"
@onready var death_screen_ui: CanvasLayer = $"../UIElements/deathScreenUI"
@onready var pickups: Node = $"../Pickups"
@onready var level_complete_ui: CanvasLayer = $"../UIElements/levelCompleteUI"


func a_sleep(seconds: int = 2):
	await get_tree().create_timer(seconds).timeout


func restart_game():
	# reload the game
	get_tree().reload_current_scene()


func check_win_condition(score: int):
	if score >= total_containers:
		level_complete_ui.show_game_complete_screen(
			"Congratulations!\n\nYou have collected " + str(score) + 
			" containers"
		)
		await a_sleep(5)
		restart_game()
		
	

func update_score(amount: int = 1):
	score += 1
	score_ui.update_score_ui(score)
	
	check_win_condition(score)
	
func remove_player_from_scene(body):
	body.get_node('CollisionShape2D').queue_free()



func game_over(body: Node2D):
	print("you died!")
	
	remove_player_from_scene(body)
	
	# show the death screen
	death_screen_ui.show_death_screen()
	# wait for 2 sec for screen to show up
	await a_sleep()
	
	restart_game()



func _ready() -> void:
	#timer.start()
	print("removing text after delay")
	Engine.time_scale = 1
