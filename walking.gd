extends State

@export var character_body : CharacterBody2D
@export var player_resource : Resource
@export var idle_state : State
@export var attack_state : State

var direction : Vector2

func on_enter():
	pass
	
func on_exit():
	pass
	
func update(_delta : float):
	pass

func physics_update(delta : float):
	var player_movement = player_axis(delta)
	var player_normalized = player_movement.normalized()
	character_body.velocity = player_normalized * player_resource.player_movement_speed
	
	
	character_body.move_and_slide()
	pass
	
func player_axis(delta):
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	return direction
	
func state_check(delta):
	if character_body.velocity == Vector2.ZERO:
		move(idle_state)
		
	if Input.is_action_pressed("attack"):
		move(attack_state)
	pass

func state_all_input(_event : InputEvent):
	pass
	
func state_key_input(_event : InputEventKey):
	pass
