extends CharacterBody3D

signal hit

# How fast the player moves in meters per second
@export var speed = 14
# The downward acceleration while in the air, in meters per second squared.
@export var fall_acceleration = 75
# Vertical impulse applied to the character upon jumping in meters per second.
@export var jump_impulse = 20
# Vertical impulse applied to the character upon bouncing over a mob
# in meters per second.
@export var bounce_impulse = 16

var target_velocity = Vector3.ZERO


func _physics_process(delta):

	var direction = Vector3.ZERO

	# Déplacement
	if Input.is_action_pressed("Player_Right"):
		direction.x = direction.x + 1
	if Input.is_action_pressed("Player_Left"):
		direction.x = direction.x - 1
	if Input.is_action_pressed("Player_Down"):
		direction.z = direction.z + 1
	if Input.is_action_pressed("Player_Up"):
		direction.z = direction.z - 1

	# eviter les diagonales
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		#$head.look_at(position + direction, Vector3.UP)

	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# collision (1 par frame)
	for index in range(get_slide_collision_count()):
		var collision = get_slide_collision(index)

		# si la collision est avec le sol
		if collision.get_collider() == null:
			continue

		# si la collision est avec un objet
		if collision.get_collider().is_in_group("object"):
			var object = collision.get_collider()
			# collect
			object.collect()
			# evite les répétition de l'action
			break

	# Moving the Character
	velocity = target_velocity
	move_and_slide()

# sert a rien mais je le garde au cas où
func die():
	hit.emit()
	queue_free()

func _on_mob_detector_body_entered(body):
	die()
