extends CharacterBody3D
@export var speed:float
@export var horizontalAxe : float
@export var verticalAxe : float
@export var direction : Vector3
@export var camera: Node3D
var objet: bool
var accessable: bool
var target_velocity = Vector3.ZERO
@export var view_speed = 0.0075
@export var porte : RigidBody3D
@export var timer : Node
var life : int
signal collected


func wait(seconds: float) -> void:
	await get_tree().create_timer(1.0).timeout

# Called when the node enters the scene tree for the first time.
func _ready():
	life = 1
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("Player_Right"):
		direction.x = direction.x + 1 * speed
	if Input.is_action_pressed("Player_Left"):
		direction.x = direction.x - 1 * speed
	if Input.is_action_pressed("Player_Down"):
		direction.z = direction.z + 1 * speed
	if Input.is_action_pressed("Player_Up"):
		direction.z = direction.z - 1 * speed
	if Input.is_action_just_pressed("Dash"):
		timer.start()
		speed += 35
	if Input.is_action_pressed("Jump"):
		direction.y = direction.y + 50

	# Eviter les diagonales
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		#Head.look_at(position + direction, Vector3.UP)

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	
	for index in range(get_slide_collision_count()):
		# We get one of the collisions with the player
		var collision = get_slide_collision(index)

		# If the collision is with ground
		if collision.get_collider() == null:
			continue

		# If the collider is with a mob
		if collision.get_collider().is_in_group("object"):
			var object = collision.get_collider()
			if Vector3.UP.dot(collision.get_normal()) > 0.1:
				object.collected()
				break

	# Moving the Character
	velocity = target_velocity
	move_and_slide()
	
	
func _input(event):
	if event is InputEventMouseMotion:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			camera.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))


func _on_area_3d_body_entered(body):
	if body is RigidBody3D:
		collected.emit()
		life -= 1
		if life == 0:
			queue_free()
		porte.queue_free()
	if body is StaticBody3D:
		collected.emit()
		porte.queue_free()
	pass # Replace with function body.


func _on_cube_de_calcul_2_collected():
	collected.emit()
	pass # Replace with function body.


func _on_timer_timeout():
	speed -=35
	pass # Replace with function body.
