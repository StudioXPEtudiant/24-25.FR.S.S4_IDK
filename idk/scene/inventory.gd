extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("inventory"):
		show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_button_button_up():
	hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
