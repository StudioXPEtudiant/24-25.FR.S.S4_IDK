extends CharacterBody3D
@export var Speed = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func physic_process(delta):
	velocity = Vector3.FORWARD * Speed
	move_and_slide()
