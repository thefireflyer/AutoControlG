extends Panel

var locked = true

func _on_password_text_entered(new_text):
	if new_text == DataLibrary.password:
		locked = false
		name = "Settings"
		#$settings_button.visible = true
		for new_environment in DataLibrary.locked["environments"].keys():
			DataLibrary.environments[new_environment] = DataLibrary.locked["environments"][new_environment]
			
		
		for new_link in DataLibrary.locked["links"].keys():
			DataLibrary.links[new_link] = DataLibrary.locked["links"][new_link]
		
		get_parent().get_node("Overview/Environments")._ready()
		#get_parent().current_tab = 0
		locked = false
		#OS.execute("", [], false)
		#get_tree().quit()

func lock():
	if locked:
		return
	name = "Locked"
	locked = true
	#$settings_button.visible = false
	get_parent().get_node("Overview/Environments")._on_environments_item_selected(DataLibrary.environments.size())
	
	for new_environment in DataLibrary.locked["environments"].keys():
		
		DataLibrary.environments.erase(new_environment)
		
	
	for new_link in DataLibrary.locked["links"].keys():
		DataLibrary.links.erase(new_link)
	
	get_parent().get_node("Overview/Environments")._ready()

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		lock()
	
	
	$LockScreen.visible = locked
	$Settings.visible = not locked

