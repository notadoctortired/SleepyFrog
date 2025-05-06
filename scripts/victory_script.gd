extends Area3D
var vic = ""

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		vic = get_parent().get_parent().get_parent().get_node("Control/VictoryLab")
		vic.visible = true
		get_tree().paused = true
		
