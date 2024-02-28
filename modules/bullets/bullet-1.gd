extends Node2D


@export var bullet_speed : float
@export var distance : float

var direction : Vector2
var final_location : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	if direction != null:
		final_location = direction * 1200

	await get_tree().create_timer(distance).timeout
	queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if final_location != null:
		#global_position.x = move_toward(global_position.x, final_location.x, bullet_speed * delta)
		#global_position.y = move_toward(global_position.y, final_location.y, bullet_speed * delta)
		global_position += direction * 1200 * delta

	pass
