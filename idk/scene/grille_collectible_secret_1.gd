extends Node3D
var verrou = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open_verrou():
	verrou -= 1
	if verrou == 2:
		$verrou1/OmniLight3D.queue_free()
	elif verrou == 1:
		$verrou2/OmniLight3D2.queue_free()
	else:
		queue_free()
