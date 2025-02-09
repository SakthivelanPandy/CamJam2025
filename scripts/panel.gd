extends Control

@onready var dialogue_label = $Label
@onready var yes_button = $Button
@onready var no_button = $Button2

func _ready():
	self.visible = false  # Hide initially

func show_dialogue(text: String, yes_callback: Callable, no_callback: Callable):
	self.visible = true  # Show the dialogue window
	dialogue_label.text = text  # Set the text in the dialogue
	if yes_button != null and no_button != null:
		yes_button.connect("pressed", yes_callback)  # Connect the yes button
		no_button.connect("pressed", no_callback)    # Connect the no button
