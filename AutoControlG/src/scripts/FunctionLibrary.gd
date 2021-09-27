extends Node

#==================Environments==============================
func setup_env(current_environment, new_environment_data):
	if current_environment != null:
		current_environment.close()
	
	var new_environment = ClassLibrary.AppEnvironment.new()
	
	if new_environment_data.has("apps"):
		new_environment.launch(new_environment_data["apps"])
	
	if new_environment_data.has("links"):
		for link in new_environment_data["links"]:
			OS.shell_open(link)
	
	if new_environment_data.has("music"):
		#TODO: implement environment specific music
		pass
	
	return new_environment

