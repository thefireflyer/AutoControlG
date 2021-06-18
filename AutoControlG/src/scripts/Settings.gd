extends Panel

var current_group = "General"
var current_item = ""

func _ready():
	update_groups()
	update_items()
	


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

