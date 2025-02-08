extends Label

@onready var market=$"../.."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	market.offerAccept.connect(_on_offer_accept)
	text = "choose an offer"
	$".".text = text

func _on_offer_accept(offer):
	if market.can_afford_offer(offer):
		var selected_offer = offer
		text = "Offer accepted! Press 'Trade' to confirm."
		market.trade_button.visible = true
		$".".text=text
	else:
		print("You don't have enough ingredients for this offer.")
		text = "You don't have enough ingredients for this offer."
		market.trade_button.visible = false
		$".".text=text
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
