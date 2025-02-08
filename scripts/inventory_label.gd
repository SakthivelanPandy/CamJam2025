extends Label


var gameManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../../gameManager".inventory_update.connect(_update_inventory)
	text = "Inventory: \n"
	for ingredient in Global.inventory:
		text += ingredient + "     " + str(Global.inventory[ingredient]) + "\n"
	$".".text = text

func _update_inventory():
	print("inventory has been updated")
	text = "Inventory: \n"
	for ingredient in Global.inventory:
		text += ingredient + "     " + str(Global.inventory[ingredient]) + "\n"
	$".".text = text

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
