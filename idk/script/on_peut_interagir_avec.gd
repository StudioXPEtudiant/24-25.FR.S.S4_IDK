class_name OnPeutInteragirAvec extends Node

var parent

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func a_portee():
	print(parent)


func hors_de_portee():
	pass
	

func connecter_au_parent():
	parent.add_user_signal("focused")
	parent.add_user_signal("unfocused")
	parent.add_user_signal("interacted")
