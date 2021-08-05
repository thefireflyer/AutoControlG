extends Panel


func _draw():
	$TabContainer/Advanced/Panel/ScrollContainer/VBoxContainer/TextEdit.text = to_json(DataLibrary.data)
	$TabContainer/General/Panel/ScrollContainer/VBoxContainer/CheckButton.pressed = DataLibrary.data["General"]["maximize"] == "true"
	$TabContainer/General/Panel/ScrollContainer/VBoxContainer/LineEdit.text = DataLibrary.data["General"]["password"]


var file_path = "user://config"

func _on_SaveB_pressed():
	
	var data = JSON.parse($TabContainer/Advanced/Panel/ScrollContainer/VBoxContainer/TextEdit.text).result
	data["General"]["maximize"] = str($TabContainer/General/Panel/ScrollContainer/VBoxContainer/CheckButton.pressed).to_lower()
	data["General"]["password"] = $TabContainer/General/Panel/ScrollContainer/VBoxContainer/LineEdit.text
	
	var env_data = $TabContainer/Environments/Panel.get_data("Environments")
	print(env_data)
	data["Environments"] = env_data
	
	
	var link_data = $TabContainer/Links/Panel.get_data("Links")
	print(link_data)
	data["Links"] = link_data
	
	var music_data = $TabContainer/Music/Panel.get_data("Music")
	print(music_data)
	data["Music"] = music_data
	
	var config_file = File.new()
	config_file.open(file_path, File.WRITE)
	
	config_file.store_line(to_json(data))
	
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
