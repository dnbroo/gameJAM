extends Node2D

#this gets our mob spawn line
@export var mob_spawner : PathFollow2D

#this lets us pick our mob
@export var mob_scene : PackedScene

@export var mob_spawn_location : Node2D

@export var mob_spawn_timer : Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	mob_spawn_timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mob_spawn_timer_timeout():
	print('timer up')
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	mob_spawner.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawner.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawner.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	#var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	#mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	mob_spawn_location.add_child(mob)
