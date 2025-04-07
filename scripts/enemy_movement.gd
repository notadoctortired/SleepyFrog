extends CharacterBody3D

@export var speed = 25
var player = null

func _ready():
	$Radius.body_entered.connect(_on_Radius_body_entered)
	$Radius.body_entered.connect(_on_Radius_body_exited)

func _physics_process(delta):
	velocity = Vector3.ZERO
	if player:
		velocity = (player.position - position).normalized() * speed
		$MeshInstance3D.basis = Basis.looking_at(player.position)
		
	move_and_slide()

func _on_Radius_body_entered(body):
	if body.name == "Player":
		player = body
		print("entered")

func _on_Radius_body_exited(body):
	if body.name == "Player":
		player = null
