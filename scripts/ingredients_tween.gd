extends Node


func animate_ingredient(target_node: Node2D, target_position: Vector2, animation_duration: float):
	var tween = create_tween()
	var sprite = target_node.get_node("Sprite2D")
	
	tween.parallel().tween_property(sprite, "scale", Vector2(0, 0), animation_duration)
	# Animate position
	tween.parallel().tween_property(sprite, "position", target_position, animation_duration)

	# Animate rotation (rotate 180 degrees)
	tween.parallel().tween_property(sprite, "rotation", deg_to_rad(720), animation_duration)
	
func random_move(target_node: Node2D, target_position: Vector2, speed:float):
	var tween = create_tween()
	tween.tween_property(target_node, "position", target_position, speed)
	await tween.finished
	
