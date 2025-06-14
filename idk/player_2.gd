extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var camera : Camera3D
@export var tete : Node3D

var est_accroupi = false
@export var animation : AnimationPlayer
@export_range (1, 10, 0.1) var s_accroupir_vitesse : float = 3.0
@export var shapecast_s_accroupir : ShapeCast3D
@export var saccroupir : bool = false


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Player_Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Player_Left", "Player_Right", "Player_Up", "Player_Down")
	var direction = (tete.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		

	move_and_slide()
	
	#print(est_accroupi)

func _input(event):
	if event is InputEventMouseMotion:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			tete.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))
			
	if event.is_action_pressed("s'accroupir") and saccroupir == true:
		s_accroupir()
	if event.is_action_pressed("s'accroupir") and est_accroupi == false and saccroupir == false:
		animation.play("saccroupir", -1, s_accroupir_vitesse)
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
			animation.play("saccroupir", 0, s_accroupir_vitesse)
		false:
			animation.play("saccroupir", 0, -s_accroupir_vitesse, true)
	
func _on_animation_player_animation_started(anim_name):
	if anim_name == "saccroupir":
		est_accroupi = !est_accroupi

func verification_collision_accroupi():
	if shapecast_s_accroupir.is_colliding() == false:
		en_train_de_s_accroupir(false)
	if shapecast_s_accroupir.is_colliding() == true:
		await get_tree().create_timer(0.1).timeout
		verification_collision_accroupi()
