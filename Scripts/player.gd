extends CharacterBody2D


const SPEED = 460.0
const JUMP_VELOCITY = -700.0

#var gameScene = preload("res://Scenes/game.tscn")
#@export var FisherNPC = Label

signal walkedUpToNPC(name:String)
signal interactwithNPC(name:String)


@export var playerName = "Matthew"
@export var money = 20
var nextToBoatGuy = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta*1.5

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	if(direction > 0):
		animated_sprite_2d.flip_h = false
	elif(direction < 0):
		animated_sprite_2d.flip_h = true
		
	#play animation
	if(direction == 0):
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("run")
		#FisherNPC.visible = false
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if nextToBoatGuy and Input.is_action_just_pressed("interact"):
		print("Sup Bro")
		interactwithNPC.emit("Boat Seller")
		

func _on_interaction_area_body_entered(body: Node2D) -> void:
	nextToBoatGuy = true
	walkedUpToNPC.emit("Boat Seller")


func _on_interaction_area_body_exited(body: Node2D) -> void:
	nextToBoatGuy = false
	walkedUpToNPC.emit("Boat Seller")
