extends Control

@onready var action_button = $Button


func update_ingredient_ui():
	var text = ""
	#for ingredient_name in Global.ingredients.keys():
		#var ingredient = Global.ingredients[ingredient_name]
		#ingredient_labels[ingredient_name].text = str(ingredient["needed"] - ingredient["collected"])
	for ingredient in Global.to_collect:
		if Global.to_collect[ingredient] > Global.inventory.get(ingredient,0):
			text +=  "You need " + str(Global.to_collect[ingredient] - Global.inventory.get(ingredient,0)) + " more " + ingredient 
			print("You need " + str(Global.to_collect[ingredient] - Global.inventory.get(ingredient,0)) + " more " + ingredient)
	if Global.check_ingredients_ready():
		text = "You have everything you need!"
		action_button.modulate = Color(1, 0, 0)  
	else:
		action_button.modulate = Color(0.5, 0.5, 0.5)  
	$"../Info".text = text


func _ready():
	update_ingredient_ui()


func _on_button_pressed() -> void:
	print("button pressed")
	if Global.check_ingredients_ready():
		print("Creating Perfume...")
		Global.next_task()
	
