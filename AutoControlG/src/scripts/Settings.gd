extends Panel

func _draw():
	load_config()
	



var file_path = "user://config"

func _on_SaveB_pressed():
	
	var config_file = File.new()
	config_file.open(file_path, File.WRITE)
	
	config_file.store_line($TabContainer/Advanced/Panel/ScrollContainer/VBoxContainer/TextEdit.text)
	
	config_file.close()
	
	
	get_tree().change_scene("res://src/scenes/Main.tscn")

func load_config():
	var config_file = File.new()
	if not config_file.file_exists(file_path):
		return false
		
	config_file.open(file_path, File.READ)
	
	$TabContainer/Advanced/Panel/ScrollContainer/VBoxContainer/TextEdit.text = config_file.get_as_text()
	var data = JSON.parse(config_file.get_as_text()).result
	
	config_file.close()
	


func _on_ResetB_pressed():
	DataLibrary.reset_config()
	get_tree().change_scene("res://src/scenes/Main.tscn")
