extends StaticBody3D
@export var joueur: Node3D

func _on_area_3d_body_entered(body):
	if body is CharacterBody3D:
		body.queue_free
