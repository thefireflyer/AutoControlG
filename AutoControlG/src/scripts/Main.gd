extends Control


func _ready():
	DataLibrary.save_config()
	DataLibrary.load_config()
	
	
	print(OS.get_datetime())
	
	#OS.window_borderless = true
	#OS.set_window_always_on_top(true)
	
	get_tree().get_root().set_transparent_background(true)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		_notification(NOTIFICATION_WM_QUIT_REQUEST)
		get_tree().quit()
	if Input.is_action_just_pressed("ui_focus_next"):
		OS.window_minimized = true


#TESTING
const FULLSCREEN_MODE = true

func maximize():
	if FULLSCREEN_MODE:
		OS.window_fullscreen = true
	else:
		OS.window_borderless = false
		OS.window_maximized = true


func _notification(what):
	if what == NOTIFICATION_WM_QUIT_REQUEST:
		if $tabs/Overview/Environments.current_environment != null:
			$tabs/Overview/Environments.current_environment.close()
