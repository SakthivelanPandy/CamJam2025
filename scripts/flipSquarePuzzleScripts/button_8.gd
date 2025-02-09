extends Button

var neighbors_index = [5,7,8,9]
# Called when the node enters the scene tree for the first time.
var facing = 0 # 0 for Tail and 1 for Head
	
func flip():
	facing = 1-facing

# Called every frame. 'delta' is the elapsed time since the previous frame.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if facing == 0:
		icon = load("res://assets/cry.png")
	else:
		icon = load("res://assets/laugh.png")
