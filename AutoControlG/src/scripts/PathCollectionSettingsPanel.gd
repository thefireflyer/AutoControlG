extends Panel


func _on_AddPathB_pressed():
	$ScrollContainer/VBoxContainer.add_child(load("res://src/scenes/PathPanel.tscn").instance())
	var AddPathButton = $ScrollContainer/VBoxContainer/AddPathB
	$ScrollContainer/VBoxContainer.remove_child(AddPathButton)
	$ScrollContainer/VBoxContainer.add_child(AddPathButton)


func _on_DeleteB_pressed():
	queue_free()


func get_data():
	
	var data = []
	
	var AddPathButton = $ScrollContainer/VBoxContainer/AddPathB
	$ScrollContainer/VBoxContainer.remove_child(AddPathButton)
	for path in $ScrollContainer/VBoxContainer.get_children():
		data.append(path.get_data())
	$ScrollContainer/VBoxContainer.add_child(AddPathButton)
	return data
