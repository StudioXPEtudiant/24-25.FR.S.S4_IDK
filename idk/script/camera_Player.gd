extends Camera3D
@export var Object_to_follow : Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = Object_to_follow.global_position 
	pass
