extends RigidBody3D
@export var value : int
@export var area_system : Node3D

func give_money():
	area_system.gain_money()
	queue_free()


func _on_area_3d_body_entered(body):
	if body is CharacterBody3D:
		body.gain_money_green()
		queue_free()
