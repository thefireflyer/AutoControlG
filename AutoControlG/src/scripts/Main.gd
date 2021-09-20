extends Control



func _process(delta):
	
	if Input.is_action_just_pressed("ui_cancel"):
		_notification(NOTIFICATION_WM_QUIT_REQUEST)
		get_tree().quit()
	if Input.is_action_just_pressed("ui_focus_next"):
		OS.window_minimized = true



func _notification(what):
	if what == NOTIFICATION_WM_QUIT_REQUEST:
		if $tabs/Overview/Environments.current_environment != null:
			$tabs/Overview/Environments.current_environment.close()
