extends Control

#==================TODO:!!========================

#=================================================



func _process(delta):
	
	if Input.is_action_just_pressed("ui_cancel"):
		#_notification(NOTIFICATION_WM_QUIT_REQUEST)
		#FunctionLibrary.encrypt_user_files()
		get_tree().quit()
	if Input.is_action_just_pressed("ui_focus_next"):
		get_tree().change_scene("res://src/scenes/EntryPoint.tscn")
		#FunctionLibrary.encrypt_user_files()
		OS.window_minimized = true

"""
func _notification(what):
	if what == NOTIFICATION_WM_QUIT_REQUEST:
		if $tabs/Overview/Environments.current_environment != null:
			$tabs/Overview/Environments.current_environment.close()
"""
func _on_loggedin():
	$SigninBox.queue_free()
	add_child(load("res://src/scenes/MainProcess.tscn").instance())
	#FunctionLibrary.decrypt_user_files()
