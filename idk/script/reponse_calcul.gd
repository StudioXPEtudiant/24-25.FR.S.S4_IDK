extends Node3D
signal collected
@export var joueur:CharacterBody3D 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = get_slide_collision(index)
	
	if collision.get_collider().is_in_group("object"):
			var object = collision.get_collider()
			# we check that we are hitting it from above.
			if Vector3.UP.dot(collision.get_normal()) > 0.1:
				object.collected()
				# Prevent further duplicate calls.

	pass

func collect():
	collected.emit()
	joueur.queue_free()
	queue_free()
