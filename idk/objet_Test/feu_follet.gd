extends Node3D
@export var speed = 60
@export var timer : Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	_move()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _move():
	global_position.y += 1 * speed
	timer.start()

func _on_timer_timeout():
	global_position.y -= 1 * speed
	_move()
