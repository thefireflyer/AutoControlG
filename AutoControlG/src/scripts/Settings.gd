extends Panel


func _draw():
	$Panel/ScrollContainer/VBoxContainer/Control/password.text = DataLibrary.user_data["password"]
	$Panel/ScrollContainer/VBoxContainer/TextEdit.text = JSON.print(DataLibrary.user_data["[data]"], "	")#to_json(DataLibrary.data)

var file_path = "user://users/"+DataLibrary.user_data["username"]

func _on_SaveB_pressed(encrypted=true):
	
	var data = JSON.parse($Panel/ScrollContainer/VBoxContainer/TextEdit.text).result
	
	var config_file = File.new()
	if encrypted:
		config_file.open_encrypted_with_pass(file_path, File.WRITE, DataLibrary.user_data["password"])
	else:
		config_file.open(file_path, File.WRITE)
	
	config_file.store_string(JSON.print(data, "	"))#store_line(to_json(data))
	
	config_file.close()
	
	
	print(DataLibrary.data["public_user_accounts"])
	print(DataLibrary.user_data["username"])
	print("removing user from public user list")
	DataLibrary.data["public_user_accounts"].remove(DataLibrary.data["public_user_accounts"].find(DataLibrary.user_data["username"]))
	if DataLibrary.user_data["[data]"]["public_user"]:
		print("adding user to public user list")
		DataLibrary.data["public_user_accounts"].append(DataLibrary.user_data["username"])
	DataLibrary.save_config()
	print(DataLibrary.data["public_user_accounts"])
	
	
	get_tree().change_scene("res://src/scenes/EntryPoint.tscn")



func _on_DeleteB_pressed():
	$AcceptDialog.popup_centered()

func _on_AcceptDialog_confirmed():
	var dir = Directory.new()
	dir.remove(file_path)
	print(DataLibrary.data["public_user_accounts"])
	DataLibrary.data["public_user_accounts"].remove(DataLibrary.data["public_user_accounts"].find(DataLibrary.user_data["username"]))
	print(DataLibrary.data["public_user_accounts"])
	print(DataLibrary.user_data["username"])
	DataLibrary.save_config()
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
	#config_file.open(file_path, File.WRITE)
	config_file.open_encrypted_with_pass(file_path, File.WRITE, DataLibrary.user_data["password"])
	
	config_file.store_line(data)
	
	config_file.close()
	
	
	get_tree().change_scene("res://src/scenes/EntryPoint.tscn")


func _on_FileDialog2_file_selected(path):
	var tmp = file_path
	file_path = path
	_on_SaveB_pressed(false)
	file_path = tmp


func _on_ExportSettingsB_pressed():
	$FileDialog2.popup_centered()


func _on_password_text_changed(new_text):
	DataLibrary.user_data["password"] = new_text
