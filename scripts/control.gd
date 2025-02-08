extends Control

@onready var action_button = $Button
@onready var ingredient_icons = {
	"ingredient_1": $ingredient_icons/icon_1,
	"ingredient_2": $ingredient_icons/icon_2
}
@onready var ingredient_labels = {
	"apple": $ingredient_labels/label_1,
	"ingredient_2": $ingredient_labels/label_2
}

func update_ingredient_ui():
	#for ingredient_name in Global.ingredients.keys():
		#var ingredient = Global.ingredients[ingredient_name]
		#ingredient_labels[ingredient_name].text = str(ingredient["needed"] - ingredient["collected"])
	for ingredient in Global.to_collect:
		if Global.to_collect[ingredient] > Global.inventory.get(ingredient,0):
			ingredient_labels[ingredient].text =  "You need " + str(Global.to_collect[ingredient] - Global.inventory.get(ingredient,0)) + " more " + ingredient 
			print("You need " + str(Global.to_collect[ingredient] - Global.inventory.get(ingredient,0)) + " more " + ingredient)
	if Global.check_ingredients_ready():
		action_button.modulate = Color(1, 0, 0)  
	else:
		action_button.modulate = Color(0.5, 0.5, 0.5)  


func _ready():
	update_ingredient_ui()


func _on_button_pressed() -> void:
	if Global.check_ingredients_ready():
		print("Creating Perfume...")
	else:
		print("You need more ingredients.")
