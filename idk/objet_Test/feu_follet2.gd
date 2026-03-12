extends RigidBody3D
@export var timer : Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("feu_follet2")
	pass # Replace with function body.


func _on_area_3d_body_entered(body):
	if body is CharacterBody3D:
		body.loose_pv_basic()
		queue_free()


func _on_timer_timeout():
	timer.start
	$AnimationPlayer.play("feu_follet2")
	pass # Replace with function body.
