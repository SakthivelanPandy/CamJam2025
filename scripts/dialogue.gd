extends Control

@onready var dialogue_label = $MarginContainer/Panel/Label
@onready var yes_button = $MarginContainer/yesButton
@onready var no_button = $MarginContainer/noButton

func _ready():
	self.visible = false  # Hide initially

# Function to show the dialogue with custom text
func show_dialogue(text: String, yes_callback: Callable, no_callback: Callable):
	self.visible = true  # Show the dialogue window
	dialogue_label.text = text  # Set the text in the dialogue
	yes_button.connect("pressed", yes_callback)  # Connect the yes button
	no_button.connect("pressed", no_callback)    # Connect the no button

# Hide the dialogue when the no button is pressed
func _on_NoButton_pressed():
	self.visible = false

# Hide the dialogue when the yes button is pressed
func _on_YesButton_pressed():
	self.visible = false
