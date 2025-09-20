extends Camera3D
@export var Object_to_follow : Node3D
var height : Vector3


# Called when the node enters the scene tree for the first time.
func _ready():
	height = Vector3(0,22,65)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = Object_to_follow.global_position + height
	pass
