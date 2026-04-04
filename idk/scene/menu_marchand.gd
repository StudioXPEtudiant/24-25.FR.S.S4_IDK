extends Control
@onready var node = $".."
var stock_potion = 3

func _ready():
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_stock_potion():
	stock_potion -= 1
	$VBoxContainer4/VBoxContainer2/Label2.text = str(stock_potion)

func _on_item_1_pressed():
	if node.money >= 3 and node.potion < 5:
		for i in range (3):
			node.loose_money()
		node.gain_potion()
		update_stock_potion()
	else:
		pass


func _on_item_2_pressed():
	pass # Replace with function body.


func _on_item_3_pressed():
	pass # Replace with function body.


# faire apparaitre ou disparaitre un objet
func disable_and_hide_node(node:Node) -> void:
	node.process_mode = 4 # = Mode: Disabled
	node.hide()

func enable_and_show_node(node:Node) -> void:
	node.process_mode = 0 # = Mode: Inherit
	node.show()
