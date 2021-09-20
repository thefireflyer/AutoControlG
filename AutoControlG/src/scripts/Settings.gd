extends Panel


func _draw():
	$Panel/ScrollContainer/VBoxContainer/TextEdit.text = JSON.print(DataLibrary.data, "	")#to_json(DataLibrary.data)

var file_path = "user://config"

func _on_SaveB_pressed():
	
	var data = JSON.parse($Panel/ScrollContainer/VBoxContainer/TextEdit.text).result
	
	var config_file = File.new()
	config_file.open(file_path, File.WRITE)
	
	config_file.store_string(JSON.print(data, "	"))#store_line(to_json(data))
	
	config_file.close()
	
	
	get_tree().change_scene("res://src/scenes/EntryPoint.tscn")



func _on_ResetB_pressed():
	$AcceptDialog.popup_centered()

func _on_AcceptDialog_confirmed():
	DataLibrary.reset_config()
	get_tree().change_scene("res://src/scenes/EntryPoint.tscn")


func _on_ImportSettingsB_pressed():
	$FileDialog.popup_centered()


func _on_FileDialog_file_selected(path):
	
	var config_file = File.new()
	if not config_file.file_exists(path):
		print("No save file :(")
		return false
		
	config_file.open(path, File.READ)
	
	var data = config_file.get_as_text()
	#print(data)
	config_file.close()
	
	config_file = File.new()
	config_file.open("user://config", File.WRITE)
	
	config_file.store_line(data)
	
	config_file.close()
	
	get_tree().change_scene("res://src/scenes/EntryPoint.tscn")


func _on_FileDialog2_file_selected(path):
	file_path = path
	_on_SaveB_pressed()
	file_path = "user://config"


func _on_ExportSettingsB_pressed():
	$FileDialog2.popup_centered()
