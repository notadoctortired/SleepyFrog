extends Area3D

var plr = ""

func _ready():
	plr = get_parent().get_parent().get_node("Player")
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	if body == plr:
		if plr.energy < 100:
			if plr.energy >= 80:
				print("plr set to full")
				plr.energy = 100
			else:
				print("plr given 20 energy")
				plr.energy += 20
			remove_child($Collision_Coffee)
			remove_child($Mesh_Coffee)
			
