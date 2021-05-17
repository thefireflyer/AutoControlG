extends Panel

class AppEnvironment:
	var open_apps = []
	
	func _init():
		pass
	
	func launch(apps, args = []):
		for app in apps:
			var tmp = OS.execute(app, args, false)
			print(tmp)
			open_apps.append(tmp)
		OS.window_minimized = true
	
	func close():
		for app in open_apps:
			print(OS.kill(app))
		open_apps = []
	

#========================Variables===========================

var current_environment = null

#============================================================


#========================Data library========================
var environments = {
	
	"Programming" : funcref(self, "setup_programming_env"),
	"2D art" : funcref(self, "setup_art2D_env"),
	"3D art" : funcref(self, "setup_art3D_env"),
	"School" : funcref(self, "setup_school_env"),
	"None" : funcref(self, "clear_env")
	
}
#============================================================


#=====================Main functionality=====================
func _ready():
	configure_options(environments.keys())

func _on_environments_item_selected(index):
	print(environments.keys()[index]+"\n")
	setup_env()
	environments.values()[index].call_func()
	


func configure_options(options):
	var res = []
	for option in options:
		res.append(option)
		res.append(null)
		res.append(false)
	$environments.items = res

#============================================================


#====================Function library========================

func setup_env():
	if current_environment != null:
		current_environment.close()
	current_environment = AppEnvironment.new()

func setup_programming_env():
	print("setting up programming environment")
	current_environment.launch(["C:/Users/Aidan/Downloads/Godot_v3.3-stable_win64.exe/Godot_v3.3-stable_win64.exe"])

func setup_art2D_env():
	print("setting up 2d art environment")
	current_environment.launch(["C:/Program Files/Krita (x64)/bin/krita.exe"])

func setup_art3D_env():
	print("setting up 3d art environment")
	current_environment.launch(["C:/Program Files/Blender Foundation/Blender 2.92/blender.exe",
	"C:/Program Files/PureRef/PureRef.exe"])

func setup_school_env():
	print("setting up school environment")
	OS.shell_open("https://mail.google.com/mail/u/1/#inbox")
	OS.shell_open("https://classroom.google.com/u/1/h")

func clear_env():
	pass

#============================================================
