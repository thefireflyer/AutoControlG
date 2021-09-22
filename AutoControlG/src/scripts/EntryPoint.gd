extends Control

#======TODO:!!======
#---config encryption---
#---multiple users---
#===================

func _ready():
	#DataLibrary.reset_config()
	
	print(OS.get_name())
	print(OS.is_debug_build())
	
	if not DataLibrary.load_config():
		DataLibrary.save_config()
	
	#if not DataLibrary.verify_config():
	#	print("invalid config found, resetting")
	#	DataLibrary.reset_config()
	
	#if DataLibrary.data["General"]["maximize"] == "true":
	if DataLibrary.data["app_data"]["maximize"] == "true":
		print("starting in maximized form")
		maximize()
	else:
		OS.window_size = Vector2(1290, 800)
		#OS.window_position = OS.get_screen_size()/2 - OS.window_size
		OS.set_window_always_on_top(false)
	
	print(OS.get_datetime())
		
	get_tree().get_root().set_transparent_background(true)
	
	
	#--------------------------------------------------
	$T.polygon[6] = Vector2(OS.get_screen_size().x, 0)
	$T.polygon[7] = OS.get_screen_size()
	$T.polygon[8] = Vector2(0, OS.get_screen_size().y)
	#OS.set_window_mouse_passthrough($T.polygon)
	#--------------------------------------------------
	
	get_tree().change_scene("res://src/scenes/Main.tscn")

#TESTING
const FULLSCREEN_MODE = true

func maximize():
	
	OS.window_position = Vector2(0,0)
	OS.window_size = OS.get_screen_size() - Vector2(0,0.1)
	OS.set_window_always_on_top(true)
	
	#old version
	return
	if FULLSCREEN_MODE:
		OS.window_fullscreen = true
	else:
		OS.window_borderless = false
		OS.window_maximized = true

