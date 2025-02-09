extends Area2D

# Signal to be emitted to the game manager
signal collected(ingredient_name)

# name of the ingredient
@export var ingredient_name: String = "Unknown Ingredient"
@export var ingredient_id: String = "ingredient1"
@export var refresh_time: float = 30.0

var already_collected = false
var initial_position : Vector2
var initial_scale : Vector2

@onready var timer = $Timer
@onready var sprite = $Sprite2D

var target_position: Vector2
@onready var tween_animation = $Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("ingredients")
	connect("body_entered", Callable(self, "_on_body_encounter"))
	var tween = create_tween()


func _on_body_encounter(body):
	initial_position = sprite.position
	initial_scale = sprite.scale
	timer.wait_time = refresh_time
	$Label.visible = true
	if body.is_in_group("player") and not already_collected:
		already_collected = true
		collected.emit(ingredient_name)  # Notify game manager
		
		var audioPlayer = $Music
		if audioPlayer and audioPlayer.stream:
			audioPlayer.play()
		
		var target_position = Vector2(-10000,-10000)
		tween_animation.animate_ingredient(self,target_position,1)
		await get_tree().create_timer(1).timeout
		timer.start()
		
		#Global.collected_ingredients.append(ingredient_id)
		
		
func _on_timer_timeout():
	sprite.position = initial_position
	sprite.scale = initial_scale
	already_collected = false
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
