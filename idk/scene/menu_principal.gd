extends Control
@onready var level1 = preload("res://scene/level 1 finaaal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_btn_button_down():
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(level1)


func _on_quit_btn_button_down():
	get_tree().quit()
