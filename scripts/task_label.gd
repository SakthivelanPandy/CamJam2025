extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.update_task.connect(_update_task)
	

# update the task bar
func _update_task() -> void:
	var text = "Task"
	for ingredient in Global.to_collect:
		text += ingredient + "     " + str(Global.inventory[ingredient]) + "\n"
	$".".text = text
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_manager_update_task() -> void:
	var text = "Task " + str(Global.current_task) + ":\n"
	for ingredient in Global.to_collect:
		text += ingredient + "     x" + str(Global.to_collect[ingredient]) + "\n"
	$".".text = text
