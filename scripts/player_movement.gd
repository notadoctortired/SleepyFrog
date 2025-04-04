extends CharacterBody3D

@export var speed = 7
@export var fall_rate = 75
@export var jump = 20
@export var energy = 100

var cooldown = false
var barrier_check = false
var target_velocity = Vector3.ZERO
	

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_backward"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
		
	if is_on_ceiling():
		cooldown = true
	if is_on_floor() and barrier_check == false:
		cooldown = false
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		target_velocity.y = jump
		energy -= 1
	if Input.is_action_just_pressed("jump") and is_on_wall() and cooldown == false:
		target_velocity.y = jump
		energy -= 2
		
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		energy -= 0.05
		$Mesh_Player.basis = Basis.looking_at(direction)
	
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_rate * delta)
	
	velocity = target_velocity
	move_and_slide()
	
	if energy <= 0:
		get_tree().reload_current_scene()
