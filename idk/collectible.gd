extends RigidBody3D
@export var collectible_interface : Node2D
@export var assigned_jewels : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body is CharacterBody3D:
		hide()
		collectible_interface.show()
		assigned_jewels.show()
		await Wait(7)
		collectible_interface.hide()
		queue_free()


# faire apparaitre ou disparaitre un objet
func disable_and_hide_node(node:Node) -> void:
	node.process_mode = 4 # = Mode: Disabled
	node.hide()

func enable_and_show_node(node:Node) -> void:
	node.process_mode = 0 # = Mode: Inherit
	node.show()

func Wait(WaitTime):
	await get_tree().create_timer(WaitTime).timeout
