class_name NPC

extends Node2D

@export var Name: String
@export var profession: String
@onready var instructionText = $InstructionObject
@onready var gameNode = get_parent()



func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.nextToBoatGuy = true
		gameNode.changeVisibility(instructionText,true)
		
func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.nextToBoatGuy = false
		gameNode.changeVisibility(instructionText,false)
		
