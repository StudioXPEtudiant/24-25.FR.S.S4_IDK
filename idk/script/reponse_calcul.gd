extends Node3D
signal collected
var joueur:Node3D 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func collect():
	collected.emit()
	joueur.queue_free()
	queue_free()
