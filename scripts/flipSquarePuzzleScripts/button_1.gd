extends Button

var neighbors_index = [1,2,4]
var facing = 0 # 0 for Tail and 1 for Head
	
func flip():
	facing = 1-facing

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if facing == 0:
		icon = load("res://assets/cry.png")
	else:
		icon = load("res://assets/laugh.png")
