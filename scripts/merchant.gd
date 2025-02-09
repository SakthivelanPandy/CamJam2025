extends Node2D

@onready var dialogue_ui = $"../Control/Panel"

var is_resting = false
var rest_time = 0 

signal start_dialogue()

func _on_body_entered(body: Node2D) -> void:
	print("hit the merchant")
	if not is_resting:
		dialogue_ui.show_dialogue("Trade basic stuff for composit ingredients", yes, no)
	else:
		dialogue_ui.show_dialogue("I'm tired...I really need a sleep...come later")
	
func _ready():
	print("merchant ready!")
	rest_time = 60
	set_process(true)

func _process(delta):
	if not is_resting:
		rest_time -= delta
		if rest_time <= 0:
			print("start resting")
			start_resting()
			rest_time = 120

func start_resting():
	is_resting = true
	dialogue_ui.visible = false

func yes():
	get_tree().change_scene_to_file("res://scenes/MarketScene.tscn")

func no():
	dialogue_ui.visible = false



	




		
		
		
