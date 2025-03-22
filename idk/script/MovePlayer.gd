extends Node3D
@export var speed:float
@export var horizontalAxe : float
@export var verticalAxe : float
@export var direction : Vector3

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
