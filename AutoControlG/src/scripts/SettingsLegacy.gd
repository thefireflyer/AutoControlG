extends Panel

var data = {}
var file_path = "user://config"


func _on_path_text_entered():
	#file_path = new_text
	load_file()
	update_tree(data)


func _on_item_name_text_entered(new_text):
	var item_data = $Tree.get_selected().get_metadata(0)
	item_data["original name"] = $Tree.get_selected().get_text(0)
	if str(item_data["value"]) == $Tree.get_selected().get_text(0):
		$Tree.get_selected().set_text(0, new_text)
		_on_value_text_entered(new_text)
	else:
		$Tree.get_selected().set_text(0, new_text)
		update_properties_panel()
	run_up_tree($Tree.get_selected())


func _on_value_text_entered(new_text):
	var item_data = $Tree.get_selected().get_metadata(0)
	item_data["original value"] = item_data["value"]
	if str(item_data["value"]) == $Tree.get_selected().get_text(0):
		item_data["value"] = new_text
		$Tree.get_selected().set_metadata(0, item_data)
		_on_item_name_text_entered(new_text)
	else:
		item_data["value"] = new_text
		$Tree.get_selected().set_metadata(0, item_data)
		update_properties_panel()
	run_up_tree($Tree.get_selected())
	


func run_up_tree(current_item):
	var parent = current_item.get_parent()
	if parent != null:
		#print(parent.get_text(0))
		var parent_data = parent.get_metadata(0)
		var current_item_data = current_item.get_metadata(0)
		if typeof(parent_data["value"]) == TYPE_DICTIONARY:
			parent_data["value"][current_item_data["original name"]] = current_item_data["value"]
			if str(current_item_data["original name"]) != current_item.get_text(0):
				if current_item.get_text(0) != "" and str(current_item_data["value"]) != "":
					parent_data["value"][current_item.get_text(0)] = current_item_data["value"]
				parent_data["value"].erase(current_item_data["original name"])
				
			
		elif typeof(parent_data["value"]) == TYPE_ARRAY:
			for item in range(parent_data["value"].size()):
				if parent_data["value"][item] == current_item.get_metadata(0)["original value"]:
					parent_data["value"][item] = current_item_data["value"]
		parent.set_metadata(0,parent_data)
		run_up_tree(parent)


func _on_value_bool_toggled(button_pressed):
	_on_value_text_entered(str($properties/value_bool.pressed))


func _on_create_button_pressed():
	var new_item = $Tree.get_selected()
	
	var item_value = $create_new_property_panel/property_value_text.text
	if item_value.to_lower() == "true" or item_value.to_lower() == "false":
		item_value = bool(item_value.to_lower())
	if item_value[0] == "{" or item_value[0] == "[":
		item_value = parse_json(item_value)
	
	new_item.set_text(0, $create_new_property_panel/property_name.text)
	new_item.set_metadata(0, {"original name":$create_new_property_panel/property_name.text,
	 "original value":item_value, "value":item_value})
	
	_on_item_name_text_entered($create_new_property_panel/property_name.text)
	_on_value_text_entered(item_value)
	update_properties_panel()
	update_tree(data)
	

func update_create_new_property_panel():
	$create_new_property_panel.visible = true
	
	
	

func update_properties_panel():
	if $Tree.get_selected().get_text(0) == "create new property":
		$properties.visible = false
		update_create_new_property_panel()
		return
	
	$properties.visible = true
	$create_new_property_panel.visible = false
	$properties/value_text.visible = false
	$properties/value_bool.visible = false
	
	$properties/item_name.text = $Tree.get_selected().get_text(0)
	#print(str($Tree.get_selected().get_metadata(0)["value"]))
	var item_data = $Tree.get_selected().get_metadata(0)["value"]
	
	if typeof(item_data) == TYPE_BOOL:
		$properties/value_bool.pressed = item_data
		$properties/value_bool.visible = true
	if typeof(item_data) == TYPE_STRING:
		$properties/value_text.text = str(item_data)
		$properties/value_text.visible = true


func update_tree(indata, parent=null):
	if parent==null:
		$Tree.clear()
		print("creating new root")
		var root = $Tree.create_item()
		root.set_text(0,"Data")
		root.set_metadata(0,{"original name":"root", "original value":indata, "value":indata})
		update_tree(indata, root)
		
	else:
		var data_entries = []
		
		if typeof(indata) == TYPE_DICTIONARY:
			data_entries = indata.keys()
		else:
			data_entries = indata
		
		for item in data_entries:
			var item_tree = $Tree.create_item(parent)
			item_tree.set_text(0,str(item))
			item_tree.collapsed = true
			
			
			if typeof(indata) == TYPE_DICTIONARY:
				
				item_tree.set_metadata(0, {"original name":str(item), "original value":indata[str(item)], "value":indata[str(item)]})
				
				if typeof(indata[item]) == TYPE_DICTIONARY or typeof(indata[item]) == TYPE_ARRAY:
					
					update_tree(indata[item], item_tree)
					var create_item = $Tree.create_item(item_tree)
					create_item.set_text(0,"create new property")
					create_item.set_metadata(0,{"original name":"create_item", "original value":null, "value":null})
		
			else:
				item_tree.set_metadata(0, {"original name":str(item), "original value":str(item),"value":str(item)})


func update_data():
	print("updating data")
	var test_data = $Tree.get_root().get_metadata(0)["value"]
	print(test_data)
	data = test_data


func load_file():
	var config_file = File.new()
	if not config_file.file_exists(file_path):
		return false
		
	config_file.open(file_path, File.READ)
	
	data = JSON.parse(config_file.get_as_text()).result
	#print(data)
	
	#events = data["events"]
	#environments = data["environments"]
	#links = data["links"]
	#good_music_urls = data["music"]
	
	#password = data["password"]
	
	config_file.close()
	$save_button.visible = true
	return true


func save_file():
	update_data()
	
	var config_file = File.new()
	config_file.open(file_path, File.WRITE)
	
	config_file.store_line(to_json(data))
	
	config_file.close()
	update_tree(data)
	
	DataLibrary.load_config()
	get_tree().change_scene("res://src/scenes/Main.tscn")



func _on_reset_button_pressed():
	DataLibrary.reset_config()
	_on_path_text_entered()
