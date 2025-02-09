extends Control

@onready var action_button = $Button


func update_ingredient_ui():
	var text = "You need:\n"
	#for ingredient_name in Global.ingredients.keys():
		#var ingredient = Global.ingredients[ingredient_name]
		#ingredient_labels[ingredient_name].text = str(ingredient["needed"] - ingredient["collected"])
	for ingredient in Global.to_collect:
		if Global.to_collect[ingredient] > Global.inventory.get(ingredient,0):
			text +=  str(Global.to_collect[ingredient] - Global.inventory.get(ingredient,0)) + " more " + ingredient + "\n"
			print("You need " + str(Global.to_collect[ingredient] - Global.inventory.get(ingredient,0)) + " more " + ingredient)
	if Global.check_ingredients_ready():
		text = "You have everything you need!"
		action_button.modulate = Color(1, 0, 0)
		print(Global.inventory)
		$Button.connect("pressed",_on_button_pressed)
		print($Button.disabled)
		print("starting next cutscene")
		#Global.next_task()
	else:
		action_button.modulate = Color(0.5, 0.5, 0.5)  
	$"../Info".text = text


func _ready():
	print("Button ready")
	$Button.connect("pressed",_on_button_pressed)
	$Button.disabled = false
	$Button.mouse_filter = Control.MOUSE_FILTER_STOP
	#$Button.emit_signal("pressed")
	#$Button.connect("mouse_entered", Callable(self, "_on_button_pressed"))
	update_ingredient_ui()
	

	


func _on_button_pressed() -> void:
	print("Button pressed")
	if Global.check_ingredients_ready():
		print("Creating Perfume...")
		Global.next_task()
		print("cutscene not played?")
	
