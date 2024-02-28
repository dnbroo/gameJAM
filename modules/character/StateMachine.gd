# state_factory.gd
extends Node

class_name StateMachine

@export var initial_state : State

var current_state : State
var states : Array[State]


func _ready():
	for child in get_children():
		if child is State:
			states.append(child)
			
	current_state = initial_state

func _process(delta):
	if current_state == null:
		return
	
	current_state.update(delta)
	pass


	
func _physics_process(delta):
	if current_state == null:
		current_state = initial_state
	
	if current_state.next_state != null:
		switch_states(current_state.next_state)
		
	current_state.physics_update(delta)
	

func switch_states(new_state : State):
	if(current_state != null):
		state_signal(new_state)
		current_state.on_exit()
		current_state.next_state = null
	
	current_state = new_state
	
	current_state.on_enter()

func state_signal(new_state):
	pass

func _input(event : InputEvent):
	if current_state != null:
		current_state.state_all_input(event)
		
func _unhandled_key_event(event : InputEventKey):
	if current_state != null:
		current_state.state_key_input(event)
