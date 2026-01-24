extends Node3D
signal collected
@export var joueur:Node3D
var move : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	move = Vector3(0,1,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func _on_body_entered(body):
	collected.emit()
	joueur.queue_free()
	queue_free()


func _on_area_3d_body_entered(body):
	if body is CharacterBody3D:
		joueur.queue_free()
		queue_free()
