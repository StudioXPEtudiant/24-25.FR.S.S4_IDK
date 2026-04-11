extends Node3D
var pv = 50
var stack_dmg = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _loose_pv():
	pv -= 1
	if pv == 0:
		queue_free()

func _stack_dmg():
	stack_dmg += 1
	if stack_dmg == 5:
		for i in range (20):
			_loose_pv()
