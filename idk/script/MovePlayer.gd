extends CharacterBody3D
@export var speed:float
@export var horizontalAxe : float
@export var verticalAxe : float
@export var direction : Vector3
@export var camera: Node3D
@export var Head: Node3D
var objet: bool
var accessable: bool
var est_accroupi = false
@export var animation : AnimationPlayer
@export_range (1, 10, 0.1) var s_accroupir_vitesse : float = 3.0
@export var shapecast_s_accroupir : Node3D
@export var saccroupir : bool = false
var target_velocity = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	shapecast_s_accroupir.add_exception($CharacterBody3D)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var direction = Vector3.ZERO

	# We check for each move input and update the direction accordingly
	if Input.is_action_pressed("move_right"):
		direction.x = direction.x + 1
	if Input.is_action_pressed("move_left"):
		direction.x = direction.x - 1
	if Input.is_action_pressed("move_back"):
		# Notice how we are working with the vector's x and z axes.
		# In 3D, the XZ plane is the ground plane.
		direction.z = direction.z + 1
	if Input.is_action_pressed("move_forward"):
		direction.z = direction.z - 1

	# Prevent diagonal moving fast af
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Iterate through all collisions that occurred this frame
	# in C this would be for(int i = 0; i < collisions.Count; i++)
	for index in range(get_slide_collision_count()):
		# We get one of the collisions with the player
		var collision = get_slide_collision(index)

		# If the collision is with ground
		if collision.get_collider() == null:
			continue

		# If the collider is with a mob
		if collision.get_collider().is_in_group("mob"):
			var mob = collision.get_collider()
			# we check that we are hitting it from above.
			if Vector3.UP.dot(collision.get_normal()) > 0.1:
				# If so, we squash it and bounce.
				mob.squash()
				# Prevent further duplicate calls.
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
			Head.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))
	if event.is_action_pressed("s'accroupir") and saccroupir == true:
		s_accroupir()
	if event.is_action_pressed("s'accroupir") and est_accroupi == false and saccroupir == false:
		animation.play("s_accroupir", -1, s_accroupir_vitesse)
	if event.is_action_released("s'accroupir") and saccroupir == false:
		#if shapecast_s_accroupir.is_colliding() == false:
			en_train_de_s_accroupir(false)
		#elif shapecast_s_accroupir.is_colliding() == true:
			#verification_collision_accroupi()

	
func s_accroupir():
	if est_accroupi == false:
		en_train_de_s_accroupir(true)
	elif est_accroupi == true and shapecast_s_accroupir.is_colliding() == false:
		en_train_de_s_accroupir(false)

func en_train_de_s_accroupir(state : bool):
	match state:
		true:
			animation.play("s_accroupir", 0, s_accroupir_vitesse)
		false:
			animation.play("s_accroupir", 0, -s_accroupir_vitesse, true)
	
func _on_animation_player_animation_started(anim_name):
	if anim_name == "s_accroupir":
		est_accroupi = !est_accroupi

func verification_collision_accroupi():
	if shapecast_s_accroupir.is_colliding() == false:
		en_train_de_s_accroupir(false)
	if shapecast_s_accroupir.is_colliding() == true:
		await get_tree().create_timer(0.1).timeout
		verification_collision_accroupi()
