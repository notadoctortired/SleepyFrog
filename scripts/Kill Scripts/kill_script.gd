extends Area3D

var plr = ""

func _ready():
	plr = get_parent().get_parent().get_parent().get_node("Player")
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body == plr:
		get_tree().reload_current_scene()
