extends RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("feu_follet1")
	pass # Replace with function body.


func _on_area_3d_body_entered(body):
	if body is CharacterBody3D:
		body.queue_free()
	pass # Replace with function body.
