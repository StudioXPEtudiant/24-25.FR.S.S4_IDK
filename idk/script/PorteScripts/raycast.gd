extends RayCast3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interagir"):
		var objetTouche = get_collider()
		if objetTouche != null:
			if objetTouche.has_method("activer"):
				objetTouche.activer()
	#if is_colliding():
		#var objetTouché = get_collider()
		#if objetTouché.has_method("activer") && Input.is_action_just_pressed("interagir"):
			#objetTouché.activer()
