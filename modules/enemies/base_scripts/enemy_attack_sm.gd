extends RigidBody2D

@export var health_node : enemy_health_node

func _physics_process(delta):
	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print(area)
	print(area.get_groups())
	if area.is_in_group('projectile'):
		health_node.take_damage()
	pass # Replace with function body.
