extends Node2D

@export var aim_sprite : Sprite2D
@export var ray_aimcast : RayCast2D

var direction_to_cursor : Vector2
var screen_size : Vector2
var aim_location : Vector2
var mouse_position : Vector2
var current_instance

var bullet = preload("res://modules/bullets/bullet-1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_position = get_global_mouse_position()
	direction_to_cursor = global_position.direction_to(mouse_position)
	
	ray_aimcast.target_position = mouse_position
	
	aim_sprite.position = direction_to_cursor * 100
	pass

func fire():
	current_instance = bullet.instantiate()
	current_instance.global_position = aim_sprite.global_position
	current_instance.direction = direction_to_cursor
	get_parent().get_parent().add_child(current_instance)
	pass
