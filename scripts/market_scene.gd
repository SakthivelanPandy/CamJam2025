extends Control

@onready var grid_container = $Panel/GridContainer
@onready var Button1 = $Panel/Button1
@onready var Button2 = $Panel/Button2
@onready var Button3 = $Panel/Button3
@onready var trade_button = $Panel/Button
@onready var instructions_label = $Panel/InstructionsLabel



var offers = []

var selected_offer = null
var offer1 = {}
var offer2 = {}
var offer3 = {}

func _ready():
	generate_random_offers()

func generate_random_offers():
	offers = Global.generate_deals()
	offer1 = offers[0]
	offer2 = offers[1]
	offer3 = offers[2]
	Button1.text = offer1["offer_text"]
	Button2.text = offer2["offer_text"]
	Button3.text = offer3["offer_text"]
		
func _on_offer_accepted(offer):
	if can_afford_offer(offer):
		selected_offer = offer
		instructions_label.text = "Offer accepted! Press 'Trade' to confirm."
		trade_button.visible = true
	else:
		instructions_label.text = "You don't have enough ingredients for this offer."

func can_afford_offer(offer):
	var player_ingredients = Global.collected_ingredients  # Replace with actual logic for player ingredients
	for ingredient in offer["cost"].keys():
		if player_ingredients[ingredient] < offer["cost"][ingredient]:
			return false
	return true

func _on_trade_button_pressed():
	if selected_offer:
		process_trade(selected_offer)
		instructions_label.text = "Trade completed!"
		trade_button.visible = false



func process_trade(offer):
	for ingredient in offer["cost"].keys():
		Global.decrease_ingredient(ingredient, offer["cost"][ingredient])

	for ingredient in offer["reward"].keys():
		Global.add_ingredient(ingredient, offer["reward"][ingredient])


func _on_button_1_pressed() -> void:
	_on_offer_accepted(offer1)
func _on_button_2_pressed() -> void:
	_on_offer_accepted(offer2)
func _on_button_3_pressed() -> void:
	_on_offer_accepted(offer3)



func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
