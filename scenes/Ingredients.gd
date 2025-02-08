extends Area2D

# Signal to be emitted to the game manager
signal collected(ingredient_name)

# name of the ingredient
@export var ingredient_name: String = "Unknown Ingredient"
@export var ingredient_id: String = "ingredient1"
var already_collected = false

var target_position: Vector2
@onready var tween_animation = $Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("ingredients")
	connect("body_entered", Callable(self, "_on_body_encounter"))
	var tween = create_tween()


func _on_body_encounter(body):
	if body.is_in_group("player") and not already_collected:
		already_collected = true
		collected.emit(ingredient_name)  # Notify game manager
		
		var audioPlayer = $Music
		if audioPlayer and audioPlayer.stream:
			audioPlayer.play()
		
		target_position = body.position
		tween_animation.animate_ingredient(self,target_position,1)
		
		Global.collected_ingredients.append(ingredient_id)
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
