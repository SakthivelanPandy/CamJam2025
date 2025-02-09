extends Node2D

signal update_task

var inventory = {}
var to_collect = {}
var current_task = 1
var collected_ingredients = []
const MARKET_TIME = 30
var deals = []
var rest_market_time = MARKET_TIME

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
	#print(tasks[current_task -1])
	assign_task()


func cutscene(num):
	print("playing cutscene")
	print("res://scenes/cs_" + str(current_task + 1) + ".tscn")
	get_tree().change_scene_to_file("res://scenes/cs_" + str(current_task + 1) + ".tscn")
	#var new_scene = load("res://scenes/cs_" + str(current_task + 1) + ".tscn").instantiate()
	#get_tree().root.add_child(new_scene)
	#get_tree().current_scene.queue_free()  # Remove the old scene manually
	#get_tree().current_scene = new_scene

	
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
		["bird","rosemary","hyacinth"],
		["basil","bird","amber"],
		["orange","orange","basil","sage"],
		["rose","rose","rose","rose","sage","sage","rosemary"],
		["rose","basil","orange","bird","bird","sage","hyacinth"],
		["Thats all folks"]
	]

func _ready() -> void:
	assign_task()
	deals = generate_deals()


var all_ingredient = ["apple", "banana", "orange","styrene","methyl pyruvate","vanilla extract","tobacco essence"]
var basic_ingredient = ["basil","rose","bird","orange","sage","rosemary","hyacinth","amber"]
var composit_ingredient = ["styrene","methyl pyruvate","vanilla extract","tobacco essence"]

var l1 = basic_ingredient.size()
var l2 = composit_ingredient.size()
const NUM_DEALS = 3

func pop_deal():
	var num_pay = int(randfn(6, 2))
	var num_get = int(randfn(3, 1))
	var index_1 = randi() % l1
	var index_2 = randi() % l2
	var pay_good = basic_ingredient[index_1]
	var get_good = composit_ingredient[index_2]
	var deal = {
		"offer_text": str(num_pay)+" "+pay_good+" for "+str(num_get)+" "+get_good, 
		"cost": {pay_good : num_pay},
		"reward": {get_good : num_get}
	}
	return deal

func _process(delta):
	if rest_market_time > 0:
		rest_market_time -= delta
	else:
		print("refresh market")
		deals = generate_deals()
		rest_market_time = MARKET_TIME

func generate_deals():
	var deals = []
	for i in range(NUM_DEALS):
		deals.append(pop_deal())
	return deals

	
