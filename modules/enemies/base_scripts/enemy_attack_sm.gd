extends CharacterBody2D

@export var health_node : enemy_health_node
@export var max_speed : float
@export var health_sprite : Polygon2D

var has_health : bool

func _ready():
	pass

func _physics_process(delta): 
	if GlobalReferences.center_tower != null:
		#if enemy has health piece, move away from tower
		if not has_health:
			health_sprite.visible = false
			velocity.x = move_toward(-global_position.x, GlobalReferences.center_tower.global_position.x, 1 * delta)
			velocity.y = move_toward(-global_position.y, GlobalReferences.center_tower.global_position.y, 1 * delta)
		#if enemy does not have health piece, move towards tower
		else:
			health_sprite.visible = true
			velocity.x = move_toward(global_position.x, GlobalReferences.center_tower.global_position.x, 1 * delta)
			velocity.y = move_toward(global_position.y, GlobalReferences.center_tower.global_position.y, 1 * delta)
		
	velocity.x = clampf(velocity.x, -max_speed, max_speed)
	velocity.y = clampf(velocity.y, -max_speed, max_speed)

	move_and_slide()
	pass


func _on_enemyarea_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group('projectile'):
		health_node.take_damage()
	pass # Replace with function body.


func _on_enemy_attack_area_body_entered(body):
	if body.is_in_group('tower'):
		has_health = true
	pass # Replace with function body.
