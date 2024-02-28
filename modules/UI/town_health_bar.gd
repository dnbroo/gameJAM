extends ProgressBar

@export var town_health : Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	max_value = town_health.max_health
	value = town_health.current_health
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = town_health.current_health
	pass
