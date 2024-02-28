extends Node2D

class_name enemy_health_node

@export var max_health : int

var current_health : int

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage():
	print($"..", 'has been hit!')
	current_health -= 1
	
	if current_health <= 0:
		print($"..", 'has died!')
		$"..".queue_free()
	pass
