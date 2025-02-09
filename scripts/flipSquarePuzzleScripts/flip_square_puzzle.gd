extends Control

@onready var b1 = $Button1
@onready var b2 = $Button2
@onready var b3 = $Button3
@onready var b4 = $Button4
@onready var b5 = $Button5
@onready var b6 = $Button6
@onready var b7 = $Button7
@onready var b8 = $Button8
@onready var b9 = $Button9
@onready var next = $Next
@onready var back = $Back
@onready var label = $Label

var puzzles = [[b2,b5,b8],[b4,b5,b6],[b2,b3,b4,b6,b7,b8]]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_puzzle()
	next.visible = false
	back.visible = true
	label.text = "Have a BIG smile"

func all_head():
	return b1.facing and b2.facing and b3.facing and b4.facing and b5.facing and b6.facing and b7.facing and b8.facing and b9.facing

func generate_puzzle():
	var n = randi() % 3
	if n==0:
		b2.flip()
		b5.flip()
		b8.flip()
	if n==1:
		b4.flip()
		b5.flip()
		b6.flip()
	if n==2:
		b2.flip()
		b3.flip()
		b4.flip()
		b6.flip()
		b7.flip()
		b8.flip()

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_button_1_pressed() -> void:
	b1.flip()
	b2.flip()
	b4.flip()


func _on_button_2_pressed() -> void:
	b1.flip()
	b2.flip()
	b3.flip()
	b5.flip()


func _on_button_3_pressed() -> void:
	b2.flip()
	b3.flip()
	b6.flip()


func _on_button_4_pressed() -> void:
	b1.flip()
	b4.flip()
	b5.flip()
	b7.flip()


func _on_button_5_pressed() -> void:
	b2.flip()
	b4.flip()
	b5.flip()
	b6.flip()
	b8.flip()


func _on_button_6_pressed() -> void:
	b3.flip()
	b5.flip()
	b6.flip()
	b9.flip()


func _on_button_7_pressed() -> void:
	b4.flip()
	b7.flip()
	b8.flip()


func _on_button_8_pressed() -> void:
	b5.flip()
	b7.flip()
	b8.flip()
	b9.flip()


func _on_button_9_pressed() -> void:
	b6.flip()
	b8.flip()
	b9.flip()

func _process(delta: float) -> void:
	if all_head():
		b1.visible = false
		b2.visible = false
		b3.visible = false
		b4.visible = false
		b5.visible = false
		b6.visible = false
		b7.visible = false
		b8.visible = false
		b9.visible = false
		label.text = "Passed!"
		next.visible = true


func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/perfume_house.tscn")



func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
