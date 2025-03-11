extends Label

@export var timer_value = 120

func _process(delta):
	text = str(snapped(timer_value,0.1))
	
	timer_value -= 1*delta
	
	if timer_value <= 0:
		get_tree().reload_current_scene()
