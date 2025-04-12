extends CharacterBody3D

# How fast the player moves in meters per second.
@export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO




func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("Player_Right"):
		direction.x += 1
	if Input.is_action_pressed("Player_Left"):
		direction.x -= 1
	if Input.is_action_pressed("Player_Down"):
		direction.z += 1
	if Input.is_action_pressed("Player_Up"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		#$Pivot.basis = Basis.looking_at(direction)

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Moving the Character
	velocity = target_velocity
	move_and_slide()
	
	# Iterate through all collisions that occurred this frame
	for index in range(get_slide_collision_count()):
		# We get one of the collisions with the player
		var collision = get_slide_collision(index)

		#if there are many collision in one frame
		if collision.get_collider() == null:
			continue

		# If the collider is with a object
		if collision.get_collider().is_in_group("object"):
			var mob = collision.get_collider()
			
