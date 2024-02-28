extends CharacterBody2D

@export var tower_health : Node2D

func _ready():
	GlobalReferences.center_tower = self
	pass
	
func _physics_process(delta):

	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group('enemy'):
		tower_health.take_damage()
	pass # Replace with function body.
