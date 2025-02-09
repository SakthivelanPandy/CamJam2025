extends Control

@onready var grid_container = $Panel/GridContainer
@onready var Button1 = $Panel/Button1
@onready var Button2 = $Panel/Button2
@onready var Button3 = $Panel/Button3
@onready var trade_button = $Panel/Button
@onready var instructions_label = $Panel/InstructionsLabel

signal offerAccept(offer)

var offers = []

var selected_offer = null
var offer1 = {}
var offer2 = {}
var offer3 = {}
var current_button = null

func _ready():
	get_offers()

func get_offers():
	offers = Global.deals
	offer1 = offers[0]
	offer2 = offers[1]
	offer3 = offers[2]
	Button1.text = offer1["offer_text"]
	Button2.text = offer2["offer_text"]
	Button3.text = offer3["offer_text"]
		
func _on_offer_accepted(offer):
	emit_signal("offerAccept",offer)

func can_afford_offer(offer):
	var player_ingredients = Global.inventory  
	for ingredient in offer["cost"].keys():
		if ingredient not in player_ingredients.keys():
			return false
		if player_ingredients[ingredient] < offer["cost"][ingredient]:
			return false
	return true

func _on_trade_button_pressed():
	print("trade button")
	if selected_offer:
		process_trade(selected_offer)
		instructions_label.text = "Trade completed!"
		trade_button.visible = false
		current_button.visible = false
		current_button = null



func process_trade(offer):
	for ingredient in offer["cost"].keys():
		#Global.decrease_ingredient(ingredient, offer["cost"][ingredient])
		Global.inventory[ingredient] -= offer["cost"][ingredient]
		print(ingredient,offer["cost"][ingredient])

	for ingredient in offer["reward"].keys():
		#Global.add_ingredient(ingredient, offer["reward"][ingredient])
		if ingredient in Global.inventory:
			Global.inventory[ingredient] += offer["reward"][ingredient]
		else:
			Global.inventory[ingredient] = offer["reward"][ingredient]
		print(ingredient,offer["reward"][ingredient])

func _on_button_1_pressed() -> void:
	current_button = Button1
	selected_offer = offer1
	_on_offer_accepted(offer1)
func _on_button_2_pressed() -> void:
	current_button = Button2
	selected_offer = offer2
	_on_offer_accepted(offer2)
func _on_button_3_pressed() -> void:
	current_button = Button3
	selected_offer = offer3
	_on_offer_accepted(offer3)



func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
