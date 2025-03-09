extends Node2D

var state = false

@onready var boatSeller = $"Boat Seller"
@onready var player = $Player

func _ready() -> void:
	$"Boat Seller/InstructionObject".propagate_call("set_visible", [false])
	$"Boat Seller/Dialog".propagate_call("set_visible", [false])

func _on_player_walked_up_to_npc(name: String) -> void:
	if name == boatSeller.name:
		$"Boat Seller/InstructionObject".propagate_call("set_visible", [state])
		state = not state


func _on_player_interactwith_npc(name: String) -> void:
	if name == boatSeller.name:
		$"Boat Seller/Dialog".propagate_call("set_visible",[true])
		$"Boat Seller/Dialog/Sprite2D/DialogText".text ="Hello "+ player.playerName+", would you like to buy a boat?"
