extends Node2D

class_name tower_health_script

@export var town_health : Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func take_damage():
	print('ouch!')
	town_health.current_health -= 1
	print(town_health.current_health)
	pass
