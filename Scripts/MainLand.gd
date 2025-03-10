extends Node2D

var state = false

@onready var boatSeller = $"Boat Seller"
@onready var player = $Player
@onready var boatSellerBtns = $"Boat Seller/Dialog/DialogButtons"

func _ready() -> void:
	changeVisibility($"Boat Seller/InstructionObject",false)
	changeVisibility($"Boat Seller/Dialog",false)
	changeVisibility($"Boat Seller/DialogButtons2",false)

func _on_player_walked_up_to_npc(name: String) -> void:
	if name == boatSeller.name:
		changeVisibility($"Boat Seller/InstructionObject", state)
		if not state:
			changeVisibility($"Boat Seller/Dialog",false)
		state = not state



func _on_player_interactwith_npc(name: String) -> void:
	if name == boatSeller.name:
		changeVisibility($"Boat Seller/Dialog",true)
		$"Boat Seller/Dialog/Sprite2D/DialogText".text ="Hello "+ player.playerName+", would you like to buy a boat for $500?"


func _on_button_pressed() -> void:
	if player.money >= 500:
		$"Boat Seller/Dialog/Sprite2D/DialogText".text ="Ok, here is the key. Go to the end of the dock to get in the boat"
		changeVisibility($"Boat Seller/DialogButtons2",true)
		changeVisibility($"Boat Seller/Dialog/DialogButtons1", false)
	else:
		$"Boat Seller/Dialog/Sprite2D/DialogText".text ="You do not have enough money to buy this boat."
		changeVisibility($"Boat Seller/DialogButtons2",true)
		changeVisibility($"Boat Seller/Dialog/DialogButtons1", false)
	pass


func _on_no_pressed() -> void:
	changeVisibility($"Boat Seller/Dialog",false)
	pass # Replace with function body.

func changeVisibility(targetNode: Node, visibility: bool):
	targetNode.propagate_call("set_visible",[visibility])


func _on_ok_pressed() -> void:
	_on_no_pressed()
	changeVisibility($"Boat Seller/DialogButtons2",false)
