extends Node2D
@onready var timer = $Timer
@onready var death_screen = $"../CanvasLayer/DeathScreen"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)

# let the player die
func _on_body_entered(body):
	if body.is_in_group('player') :
		print("You die")
		Engine.time_scale=0.5
		death_screen.visible = true
		Global.inventory = {}
		timer.start()
		
func _on_timer_timeout():
	Engine.time_scale=1.0
	
	death_screen.visible = false
	for ingredient in get_tree().get_nodes_in_group("ingredients"):
		ingredient._on_timer_timeout()
	get_tree().reload_current_scene()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
