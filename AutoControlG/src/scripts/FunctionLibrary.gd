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


#-----------old version---------------------------
func setup_programming_env(current_environment):
	print("setting up programming environment")
	current_environment.launch(["C:/Users/Aidan/Downloads/Godot_v3.3-stable_win64.exe/Godot_v3.3-stable_win64.exe"])

func setup_art2D_env(current_environment):
	print("setting up 2d art environment")
	current_environment.launch(["C:/Program Files/Krita (x64)/bin/krita.exe"])

func setup_art3D_env(current_environment):
	print("setting up 3d art environment")
	current_environment.launch(["C:/Program Files/Blender Foundation/Blender 2.92/blender.exe",
	"C:/Program Files/PureRef/PureRef.exe"])

func setup_school_env(current_environment):
	print("setting up school environment")
	#current_environment.launch(["C:/Program Files/BraveSoftware/Brave-Browser/Application/brave.exe"], ["https://mail.google.com/mail/u/1/#inbox"])
	#current_environment.launch(["C:/Program Files/BraveSoftware/Brave-Browser/Application/brave.exe"], ["https://classroom.google.com/u/1/h"])
	
	OS.shell_open("https://mail.google.com/mail/u/1/#inbox")
	OS.shell_open("https://classroom.google.com/u/1/h")

func clear_env(current_environment):
	pass
#============================================================

