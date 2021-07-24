extends Panel

func _on_Path_text_entered(new_text):
	if new_text == "":
		queue_free()

func _on_BrowseB_pressed():
	var pathBox = FileDialog.new()
	pathBox.mode = pathBox.MODE_OPEN_ANY
	pathBox.connect("file_selected", self, "_on_file_selected")
	add_child(pathBox)
	pathBox.popup_centered(Vector2(1000,500))
	
func _on_file_selected(path):
	$Path.text = path



func get_data():
	return $Path.text
