extends Node2D

signal update_task

var inventory = {}
var to_collect = {}
var current_task : int
var collected_ingredients = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
# Assign a new task
