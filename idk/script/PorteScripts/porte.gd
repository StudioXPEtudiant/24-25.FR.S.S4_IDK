extends StaticBody3D

var fermee = false
var activable = true
@export var animation_player: AnimationPlayer


func _process(delta):
	#if Input.is_action_just_pressed("interagir"):
		#activer()
	pass
	
func activer():
	if activable == true:
		activable = false
		fermee = !fermee
		if fermee == false:
			animation_player.play("FermetureVerticale")
		if fermee == true:
			animation_player.play("OuvertureVerticale")
		await get_tree().create_timer(1.0, false).timeout
		activable = true
