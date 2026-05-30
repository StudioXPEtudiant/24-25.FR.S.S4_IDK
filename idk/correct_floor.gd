extends Node3D
@export var floor1 : Node3D
@export var floor2 : Node3D
@export var floor3 : Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body is CharacterBody3D:
		floor1.queue_free()
		floor2.queue_free()
		floor3.queue_free()
	pass # Replace with function body.
