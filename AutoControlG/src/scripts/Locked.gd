extends Panel



func _on_password_text_entered(new_text):
	if new_text == "HELLOmonoPotato":
		OS.execute("", [], false)
		get_tree().quit()
