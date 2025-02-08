extends Node2D

signal inventory_update

var inventory = Global.inventory
var to_collect = Global.to_collect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for ingredient in $"..".get_children():
		if ingredient.is_in_group("ingredients"):
			if ingredient.ingredient_id in Global.collected_ingredients:
				ingredient.queue_free()
			else:
				ingredient.collected.connect(_on_ingredient_collected)

func _on_ingredient_collected(ingredient_name):
	if ingredient_name in inventory:
		inventory[ingredient_name] = inventory[ingredient_name] + 1
	else:
		inventory[ingredient_name] = 1
	inventory_update.emit()
	print(inventory)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
