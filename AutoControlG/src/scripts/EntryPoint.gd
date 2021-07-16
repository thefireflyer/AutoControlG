extends Control

func _ready():
	
	
	print(OS.get_name())
	print(OS.is_debug_build())
	
	if not DataLibrary.load_config():
		DataLibrary.save_config()
	
	if not DataLibrary.verify_config():
		print("invalid config found, resetting")
		DataLibrary.reset_config()
	
	if DataLibrary.data["General"]["maximize"] == ["true"]:
		print("starting in maximized form")
		maximize()
	
	
	print(OS.get_datetime())
		
	get_tree().get_root().set_transparent_background(true)
	
	#OS.set_window_mouse_passthrough(PoolVector2Array([Vector2(0,0),Vector2(0,500),Vector2(500,500),Vector2(500,0)]))
	
	get_tree().change_scene("res://src/scenes/Main.tscn")

#TESTING
const FULLSCREEN_MODE = true

func maximize():
	
	OS.window_position = Vector2(0,0)
	OS.window_size = OS.get_screen_size() - Vector2(0,1)
	OS.set_window_always_on_top(true)
	
	#old version
	return
	if FULLSCREEN_MODE:
		OS.window_fullscreen = true
	else:
		OS.window_borderless = false
		OS.window_maximized = true

