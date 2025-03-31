extends RigidBody3D

var speed = 1
var timer = 1
var respawn = false
var ran_speed = 1
var origin_pos: Vector3 = Vector3.ZERO

func _ready():
	origin_pos = get_parent().get_node("Car_Origin").position

func _integrate_forces(PhysicsDirectBodyState3D):
	print(speed)
	lock_rotation = 1
	linear_velocity.x += ran_speed
	print(linear_velocity.x)
	linear_velocity.x += speed
	
	if respawn:
		freeze = 1
	if not respawn:
		freeze = 0

func _process(delta):
	if timer > 0:
		timer -= delta
	else:
		timer = 1
		respawn = true
	
	if respawn:
		speed = randf_range(1,3)
		position = origin_pos
		respawn = false
		
