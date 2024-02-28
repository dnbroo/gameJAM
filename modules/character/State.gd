extends Node

class_name State
var character : CharacterBody2D
var next_state : State

func on_enter():
	pass
	
func on_exit():
	pass
	
func update(_delta : float):
	pass

func physics_update(_delta : float):
	pass

func state_all_input(_event : InputEvent):
	pass
	
func state_key_input(_event : InputEventKey):
	pass

func move(state : State):
	next_state = state
