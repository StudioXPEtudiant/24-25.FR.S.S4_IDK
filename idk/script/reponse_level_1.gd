extends Node3D
signal collected
@export var porte:CharacterBody3D
var move : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	move = Vector3(0,1,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range (3):
		global_position += move
		i = i+1
	for i in range (3):
		global_position -= move
		i = i+1
	pass

	


func _on_body_entered(body):
	collected.emit()
	porte.queue_free()
	queue_free()
