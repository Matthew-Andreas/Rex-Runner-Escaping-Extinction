class_name NPC

extends Node2D

@export var Name: String
@export var profession: String
@onready var instructionText = $InstructionObject



func _on_interaction_area_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Player":
		print(body.playerName)
