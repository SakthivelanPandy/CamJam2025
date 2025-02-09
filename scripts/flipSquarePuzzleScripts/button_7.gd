extends Button

var neighbors_index = [4,7,8]
# Called when the node enters the scene tree for the first time.
var facing = 0 # 0 for Tail and 1 for Head
	
func flip():
	facing = 1-facing

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if facing == 0:
		text = "T"
	else:
		text = "H"
