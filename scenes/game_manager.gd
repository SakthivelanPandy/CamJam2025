extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for ingredient in get_tree().get_nodes_in_group("ingredients"):
		ingredient.connect("collected", Callable(self, "_on_ingredient_collected"))

func _on_ingredient_collected(ingredient_name):
	print(ingredient_name + " was collected!")  # Handle ingredient logic here

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
