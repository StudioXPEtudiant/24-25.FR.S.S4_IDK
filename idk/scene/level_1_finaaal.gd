extends Node3D
var pv = 3
var money : int

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


func _on_node_3d_get_money():
	gain_money()
	update_money()
