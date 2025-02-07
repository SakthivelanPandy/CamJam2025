extends Area2D

# Signal to be emitted to the game manager
signal collected(ingredient_name)

# name of the ingredient
@export var ingredient_name: String = "Unknown Ingredient" 

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", Callable(self, "_on_body_encounter"))


func _on_body_encounter(body):
	if body.is_in_group("player"):
		emit_signal("collected", ingredient_name)  # Notify game manager
		queue_free()  # Remove ingredient from scene
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
