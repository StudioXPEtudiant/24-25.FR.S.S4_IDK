extends Node3D
@export var timer: Node
@export var Object_to_follow : Node3D
var height : Vector3


# Called when the node enters the scene tree for the first time.
func _ready():
	var height = Vector3(10,22,10)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	timer.start()
	global_position = Object_to_follow.global_position + height
	pass # Replace with function body.


func _on_timer_timeout():
	queue_free
	pass # Replace with function body.
