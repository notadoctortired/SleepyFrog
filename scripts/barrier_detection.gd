extends Area3D

var plr = ""

func _ready():
	plr = get_parent().get_parent().get_node("Player")
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_left)

func _on_body_entered(body):
	if body.name == "Player":
		plr.cooldown = true
		plr.barrier_check = true
		print("entered!")
func _on_body_left(body):
	if body.name == "Player":
		plr.cooldown = false
		plr.barrier_check = false
		print("left!")
