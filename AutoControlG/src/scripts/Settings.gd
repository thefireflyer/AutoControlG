extends Panel

var current_group = "General"
var current_item = ""

func _ready():
	update_settings_tree()
	#update_groups()
	#update_items()
	

func update_settings_tree():
	$settings/settings.clear()
	var root = $settings/settings.create_item()
	root.set_text(0,"Settings")
	
	run_through_data(DataLibrary.data, root)
	

func run_through_data(data, parent):
	var data_entries = []
	if typeof(data) == TYPE_DICTIONARY:
		data_entries = data.keys()
	else:
		data_entries = data
	
	for item in data_entries:
		var item_tree = $settings/settings.create_item(parent)
		item_tree.set_text(0,str(item))
		item_tree.collapsed = true
		item_tree.set_editable(0, true)
		
		
		if typeof(data) == TYPE_DICTIONARY:
			if typeof(data[item]) == TYPE_DICTIONARY or typeof(data[item]) == TYPE_ARRAY:
				#item_tree.set_editable(0, false)
				run_through_data(data[item], item_tree)
				var create_item = $settings/settings.create_item(item_tree)
				create_item.set_text(0,"create new property")
		
func run_through_settings(data, position):
	
	pass
	


func _on_settings_cell_selected():
	var selected_tree_item = $settings/settings.get_selected()
	var selected_item_name = selected_tree_item.get_text(0)
	
	if selected_item_name == "create new property":
		print("TODO: implement new property creation functionality")
	

func _on_settings_item_rmb_selected(position):
	print("TODO: implement delete property functionality")

func _on_save_button_pressed():
	
	run_through_settings(DataLibrary.data,Vector2(0,0))
	
	DataLibrary.save_config()


#!!========deprecated=========================!!#
func update_groups():
	
	var res = []
	for option in DataLibrary.data.keys():
		res.append(option)
		res.append(null)
		res.append(false)
	$settings/group.items = res


func update_items():
	var res = []
	for option in DataLibrary.data[current_group].keys():
		res.append(option)
		res.append(null)
		res.append(false)
	$settings/items.items = res

func update_item():
	$settings/properties/item_name.text = current_item
	
	var is_text = typeof(DataLibrary.data[current_group][current_item]) == TYPE_STRING
	var is_bool = typeof(DataLibrary.data[current_group][current_item]) == TYPE_BOOL
	var is_dict = typeof(DataLibrary.data[current_group][current_item]) == TYPE_DICTIONARY
	
	$settings/properties/item_value_bool.visible = is_bool
	$settings/properties/item_value_text.visible = is_text
	$settings/properties/items.visible = is_dict
	
	if is_bool:
		$settings/properties/item_value_bool.pressed = DataLibrary.data[current_group][current_item]
	if is_dict:
		update_items_item()
	else:
		$settings/properties/item_value_text.text = DataLibrary.data[current_group][current_item]


func update_items_item():
	pass
	
func update_items_items_item():
	pass

func get_item_items():
	pass


func _on_group_item_selected(index):
	print(DataLibrary.data.keys()[index]+"\n")
	index = index + 2*index
	current_group = $settings/group.items[index]
	
	update_items()


func _on_item_selected(index):
	print(DataLibrary.data[current_group].keys()[index]+"\n")
	current_item = DataLibrary.data[current_group].keys()[index]
	
	update_item()


func _on_items_item_selected(index):
	
	print(DataLibrary.data[current_group].keys()[index]+"\n")
	current_item = DataLibrary.data[current_group].keys()[index]
	
	update_items_items_item()



"""
func _on_save_button_pressed():
	var is_bool = typeof(DataLibrary.data[current_group][current_item]) == TYPE_BOOL
	var is_dict = typeof(DataLibrary.data[current_group][current_item]) == TYPE_DICTIONARY
	
	if is_bool:
		DataLibrary.data[current_group][current_item] = $settings/properties/item_value_bool.pressed
	if is_dict:
		DataLibrary.data[current_group][current_item] = get_item_items()
	else:
		DataLibrary.data[current_group][current_item] = $settings/properties/item_value_text.text
	
	DataLibrary.save_config()


func _on_delete_button_pressed():
	pass

"""


