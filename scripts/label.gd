extends Label

@onready var timer = $"../Timer"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = $"..".ingredient_name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer.time_left > 0:
		var new_text = "Will be refreshed in " + str(ceil(timer.time_left)) + "s"
		$".".text = new_text

func _on_timer_timeout() -> void:
	text = $"..".ingredient_name
