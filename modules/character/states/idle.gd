extends State

@export var character_body : CharacterBody2D
@export var player_resource : Resource
@export var movement_state : State

var direction : Vector2
var speed = 1500
var SPEED = 100
var max_speed = 1500

func on_enter():
	pass
	
func on_exit():
	pass
	
func update(_delta : float):
	pass

func physics_update(delta : float):
	pass
	
func state_check(delta):
	if player_axis(delta) != Vector2.ZERO:
		move(movement_state)
	pass
	
func player_axis(delta):
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	return direction

func state_all_input(event : InputEvent):
	pass
	
func state_key_input(event : InputEventKey):
	pass
