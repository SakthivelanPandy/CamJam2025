extends Label


func _process(delta: float) -> void:
	text = str(int(Global.rest_market_time)) + "seconds until refresh"
