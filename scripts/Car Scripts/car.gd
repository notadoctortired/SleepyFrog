extends RigidBody3D

@export var speed = 20
var timer = 5
var respawn = false
var origin_pos: Vector3 = Vector3.ZERO

func _ready():
	origin_pos = get_parent().get_node("Car_Origin").position

func _integrate_forces(PhysicsDirectBodyState3D):
	linear_velocity.x += 1

func _process(delta):
	if timer > 0:
		timer -= delta
	else:
		timer = 5
		respawn = true
	
	if respawn:
		position = origin_pos
		respawn = false
	
	
	
	
