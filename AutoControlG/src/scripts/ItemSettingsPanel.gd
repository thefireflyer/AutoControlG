extends Panel

func _on_AddItemB_pressed():
	
	$ScrollContainer/VBoxContainer.add_child(load("res://src/scenes/ItemSettings.tscn").instance())
	var AddPathButton = $ScrollContainer/VBoxContainer/AddItemB
	$ScrollContainer/VBoxContainer.remove_child(AddPathButton)
	$ScrollContainer/VBoxContainer.add_child(AddPathButton)

func get_data(type):
	var data = {}
	var AddPathButton = $ScrollContainer/VBoxContainer/AddItemB
	$ScrollContainer/VBoxContainer.remove_child(AddPathButton)
	for item in $ScrollContainer/VBoxContainer.get_children():
		data[item.get_node("Label").text] = item.get_data(type)
	$ScrollContainer/VBoxContainer.add_child(AddPathButton)
	
	
	return data
