extends Node3D
@export var speed:float
@export var horizontalAxe : float
@export var verticalAxe : float
@export var direction : Vector3
@export var camera: Node3D
@export var Head: Node3D
var emit: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	horizontalAxe = Input.get_axis("Player_Left", "Player_Right")
	verticalAxe = Input.get_axis("Player_Up", "Player_Down")
	direction = Vector3(horizontalAxe, 0, verticalAxe).normalized()
	position += direction * speed
	pass
	
	
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

func _emit():
	emit == true
	pass
