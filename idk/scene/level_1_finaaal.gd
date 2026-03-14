extends Node3D
var pv = 17
var money : int
var potion = 5
@onready var life_container = $health_interface/Polygon2D/life_sprite

func _ready():
	pass
func _process(delta):
	pass

#met a jour l'affichage de l'argent
#str() transforme la valeur en caractère
func update_money():
	$money_interface/Label.text = str(money)

func update_potion():
	$potion_interface/Label.text = str(potion)


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

func potion_simple():
	if pv < 17:
		pv += 1
		life_container.get_child(pv).show()
	else:
		pass




func _on_node_3d_get_money_simple():
	gain_money()
	update_money()


func _on_node_3d_get_money_green():
	for i in range(4):
		gain_money()
		update_money()


func _on_node_3d_basic_hit():
	get_hitted()


func _on_node_3d_potion_basic():
	if potion >= 1:
		if pv < 17:
			life_container.get_child(pv).show()
			pv += 1
			potion -= 1
			update_potion()
		else:
			pass
	else:
		pass



func disable_and_hide_node(node:Node) -> void:
	node.process_mode = 4 # = Mode: Disabled
	node.hide()

func enable_and_show_node(node:Node) -> void:
	node.process_mode = 0 # = Mode: Inherit
	node.show()
