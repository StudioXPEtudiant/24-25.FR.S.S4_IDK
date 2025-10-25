extends CharacterBody3D
@export var joueur: Node3D

func _on_area_3d_body_entered(body):
	joueur.queue_free
	pass # Replace with function body.
