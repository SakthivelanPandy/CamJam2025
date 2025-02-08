extends Node2D

@onready var dialogue_ui = $"../Control/Panel"

var is_resting = false
var rest_time = 0 

signal start_dialogue()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hit the merchant")
	if not is_resting:
		dialogue_ui.show_dialogue("Young man! Wanna trade for something?", yes, no)
	
func _ready():
	print("merchant ready")
	rest_time = 5 * 60
	set_process(true)

func _process(delta):
	if not is_resting:
		rest_time -= delta
		if rest_time <= 0:
			start_resting()
			rest_time = 60

func start_resting():
	is_resting = true
	dialogue_ui.visible = false

func yes():
	get_tree().change_scene_to_file("res://scenes/MarketScene.tscn")

func no():
	dialogue_ui.visible = false



	


func _on_body_entered(body: Node2D) -> void:
	print("hit the merchant")
	if not is_resting:
		dialogue_ui.show_dialogue("Young man! Wanna trade for something?", yes, no)
		
		
		
		
