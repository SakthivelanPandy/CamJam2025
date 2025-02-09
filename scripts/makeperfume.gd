extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Button ready")
	#self.connect("pressed",_on_pressed)
	print("Button connected")
	#self.emit_signal("pressed")
	print(self, self.visible, self.disabled, self.process_mode)

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#func _on_button_pressed() -> void:
	#print("Button pressed")
	#if Global.check_ingredients_ready():
		#print("Creating Perfume...")
		#Global.next_task()
#
#func _on_pressed() -> void:
	#print("Button pressed (from button)")
	#if Global.check_ingredients_ready():
		#print("Creating Perfume... (from button)")
		#Global.next_task()
