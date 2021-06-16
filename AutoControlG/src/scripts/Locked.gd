extends Panel



func _on_password_text_entered(new_text):
	if new_text == DataLibrary.password:
		for new_environment in DataLibrary.locked["environments"].keys():
			DataLibrary.environments[new_environment] = DataLibrary.locked["environments"][new_environment]
			
		
		for new_link in DataLibrary.locked["links"].keys():
			DataLibrary.links[new_link] = DataLibrary.locked["links"][new_link]
		
		get_parent().get_node("Overview/Environments")._ready()
		get_parent().current_tab = 0
		#OS.execute("", [], false)
		#get_tree().quit()

func lock():
	
	for new_environment in DataLibrary.locked["environments"].keys():
		
		DataLibrary.environments.erase(new_environment)
		
	
	for new_link in DataLibrary.locked["links"].keys():
		DataLibrary.links.erase(new_link)
	
	get_parent().get_node("Overview/Environments")._ready()
	get_parent().get_node("Overview/Environments").current_environment.close()

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		lock()
	
