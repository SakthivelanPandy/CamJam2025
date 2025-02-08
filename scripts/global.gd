extends Node2D

signal update_task

var inventory = {}
var to_collect = {}
var current_task = 1
var collected_ingredients = []

func check_ingredients_ready():
	var ready = true
	for ingredient in to_collect:
		if to_collect[ingredient] > inventory.get(ingredient,0):
			ready = false
	return ready
	
func next_task():
	# display cutscene
	cutscene(current_task)
	# take away items used from inventory
	remove_used_items()
	# give new task
	current_task += 1
	print(tasks[current_task -1])
	assign_task()
	pass


func cutscene(num):
	print("playing cutscene")
	print("res://scenes/cs_" + str(current_task + 1) + ".tscn")
	get_tree().change_scene_to_file("res://scenes/cs_" + str(current_task + 1) + ".tscn")
	print("played cutscene")
	
func remove_used_items():
	for ingredient in to_collect:
		inventory[ingredient] -= to_collect[ingredient]
		
func assign_task() -> void:
	var ingredients = tasks[current_task-1]
	to_collect = {}
	for i in ingredients:
		if i in to_collect:
			to_collect[i] = to_collect[i] + 1
		else:
			to_collect[i] = 1
	update_task.emit()
	print(to_collect) 
	
	
var tasks = [
		["apple","apple"],
		["apple","apple","apple"],
		["basil"]
		
	]

func _ready() -> void:
	assign_task()


var all_ingredient = ["apple", "banana", "orange"]

var l = all_ingredient.size()
const NUM_DEALS = 3

func pop_deal():
	var num_pay = int(randfn(6, 2))
	var num_get = int(randfn(4, 1))
	var index_1 = randi() % l
	var index_2 = randi() % l
	var pay_good = all_ingredient[index_1]
	var get_good = all_ingredient[index_2]
	var deal = {
		"offer_text": str(num_pay)+" "+pay_good+" for "+str(num_get)+" "+get_good, 
		"cost": {pay_good : num_pay},
		"reward": {get_good : num_get}
	}
	return deal

func generate_deals():
	var deals = []
	for i in range(NUM_DEALS):
		deals.append(pop_deal())
	return deals
