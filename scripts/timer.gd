extends Label

@export var timer_value = 0

func _process(delta):
	text = str(snapped(timer_value,0.1))
	
	timer_value += 1*delta
