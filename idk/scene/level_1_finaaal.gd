extends Node3D
var pv = 17
var money : int
@onready var life_container = $health_interface/Polygon2D/life_sprite

func _ready():
	pass
func _process(delta):
	pass

func update_life():
	pass

#met a jour l'affichage de l'argent
#str() transforme la valeur en caractère
func update_money():
	$money_interface/Label.text = str(money)

func gain_money():
	money += 1
func loose_money():
	if money < 1:
		print ("pas assez de thune frero")
	else:
		money -= 1

func get_hitted():
	print(pv)
	pv -= 1  # nombre de vies initial
	life_container.get_child(pv).hide()



func _on_node_3d_get_money_simple():
	gain_money()
	update_money()


func _on_node_3d_get_money_green():
	for i in range(4):
		gain_money()
		update_money()



func _on_node_3d_basic_hit():
	get_hitted()


func disable_and_hide_node(node:Node) -> void:
	node.process_mode = 4 # = Mode: Disabled
	node.hide()

func enable_and_show_node(node:Node) -> void:
	node.process_mode = 0 # = Mode: Inherit
	node.show()
