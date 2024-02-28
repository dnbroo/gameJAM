extends ProgressBar

@export var health_node : enemy_health_node

#this gets our previous health so we aren't doing so many checks
var prev_health : float

var full_health_color : Color = 'red'
var low_health_color : Color = 'orange'

#this gets 1/3 of the enemy health so we can color the bar :)
var low_health_amount : float

var sb = StyleBoxFlat.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	max_value = health_node.max_health
	value = health_node.current_health
	
	low_health_amount = health_node.max_health / 3
	
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = full_health_color
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if prev_health != health_node.current_health:
		change_health()
	pass

func change_health():
	prev_health = health_node.current_health
	
	value = health_node.current_health
	
	color_bar()
	

func color_bar():
	if health_node.current_health == health_node.max_health:
		visible = false
	else:
		visible = true
		
	if health_node.current_health <= low_health_amount:
		sb.bg_color = low_health_color
	elif health_node.current_health > low_health_amount:
		sb.bg_color = full_health_color
		
	pass
