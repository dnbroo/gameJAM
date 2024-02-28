extends "res://modules/character/State.gd"

@export var character_body : CharacterBody2D
@export var player_resource : Resource
@export var idle : State
@export var aim_node : Node2D


func on_enter():
	aim_node.fire()
	await get_tree().create_timer(player_resource.attack_delay).timeout
	move(idle)
	pass
	
func on_exit():
	pass
	
func update(_delta : float):
	pass

func physics_update(_delta : float):
	pass
	
func state_check(delta):

	pass

func state_all_input(_event : InputEvent):
	pass
	
func state_key_input(_event : InputEventKey):
	pass
