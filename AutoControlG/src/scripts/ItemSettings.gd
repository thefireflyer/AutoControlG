extends Panel

func _ready():
	$Label.text = name

func _on_AddPathB_pressed():
	$ScrollContainer/VBoxContainer.add_child(load("res://src/scenes/PathPanel.tscn").instance())
	var AddPathButton = $ScrollContainer/VBoxContainer/AddPathB
	$ScrollContainer/VBoxContainer.remove_child(AddPathButton)
	$ScrollContainer/VBoxContainer.add_child(AddPathButton)


func _on_DeleteB_pressed():
	queue_free()


func get_data(type):
	
	var data = {}
	data["locked"] = str($CheckButton.pressed)
	data["apps"] = []
	data["links"] = []
	if type == "Music" or type == "Links":
		data = []
	
	var AddPathButton = $ScrollContainer/VBoxContainer/AddPathB
	$ScrollContainer/VBoxContainer.remove_child(AddPathButton)
	for path in $ScrollContainer/VBoxContainer.get_children():
		#data["paths"].append(path.get_data())
		if type == "Environments":
			if "http" in path.get_data():
				data["links"].append(path.get_data())
			else:
				data["apps"].append(path.get_data())
		else:
			data.append(path.get_data())
			
	$ScrollContainer/VBoxContainer.add_child(AddPathButton)
	return data


func _on_Label_text_entered(new_text):
	name = new_text
	if new_text == "":
		queue_free()
