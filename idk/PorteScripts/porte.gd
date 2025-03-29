extends StaticBody3D

var fermée = false
var activable = true
@export var animation_player: AnimationPlayer


#func _process(delta):
	#if Input.is_action_just_pressed("interagir"):
		#activer()
	
func activer():
	if activable == true:
		activable = false
		fermée = !fermée
		if fermée == false:
			animation_player.play("Fermeture")
		if fermée == true:
			animation_player.play("Ouverture")
		await get_tree().create_timer(1.0, false).timeout
		activable = true
