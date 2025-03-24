extends Area3D

func _ready():
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	var plr = body
	
	if body.name == "Player":
		if plr.energy < 100:
			if plr.energy >= 80:
				print("plr set to full")
				plr.energy = 100
			else:
				print("plr given 20 energy")
				plr.energy += 20
			remove_child($Collision_Coffee)
			remove_child($Mesh_Coffee)
			
