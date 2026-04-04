extends RigidBody3D
@export var assigned_merchant_screen : Control

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body is CharacterBody3D:
		assigned_merchant_screen.show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pass # Replace with function body.


# faire apparaitre ou disparaitre un objet
func disable_and_hide_node(node:Node) -> void:
	node.process_mode = 4 # = Mode: Disabled
	node.hide()

func enable_and_show_node(node:Node) -> void:
	node.process_mode = 0 # = Mode: Inherit
	node.show()


func _on_button_pressed():
	assigned_merchant_screen.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.
