extends Node3D
signal collected
@export var assigned_door:Node3D
@export var text : Control
@export var joueur : CharacterBody3D
@export var animation : AnimationPlayer
var move : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	move = Vector3(0,1,0)
	pass # Replace with function body.

func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body is CharacterBody3D:
		joueur.pause()
		assigned_door.queue_free()
		hide()
		text.show()
		animation.play("text_door")
		await Wait(4)
		text.hide()
		joueur.unpause()
		queue_free()

func Wait(WaitTime):
	await get_tree().create_timer(WaitTime).timeout

# faire apparaitre ou disparaitre un objet
func disable_and_hide_node(node:Node) -> void:
	node.process_mode = 4 # = Mode: Disabled
	node.hide()

func enable_and_show_node(node:Node) -> void:
	node.process_mode = 0 # = Mode: Inherit
	node.show()
