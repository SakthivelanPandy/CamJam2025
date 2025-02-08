extends "res://scenes/Ingredients.gd"

@export var move_area : Rect2 = Rect2(0, 0, 0, 0)
@export var move_speed: float = 1.5
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	add_to_group("ingredients")
	connect("body_entered", Callable(self, "_on_body_encounter"))
	var tween = create_tween()
	random_move()

func random_move():
	while not already_collected:
		move_to_random_position()
		await get_tree().create_timer(1).timeout
		
func move_to_random_position():
	var target_pos = Vector2(
		randf_range(move_area.position.x, move_area.position.x + move_area.size.x),
		randf_range(move_area.position.y, move_area.position.y + move_area.size.y)
	)
	tween_animation.random_move(self, target_pos, move_speed)
	
func _process(delta: float) -> void:
	#move_to_random_position()
	pass
	
