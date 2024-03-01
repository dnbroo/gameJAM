extends Node

var center_tower
signal my_signal

func _ready():
	my_signal.connect(test)
func test(v):
	print(v)
