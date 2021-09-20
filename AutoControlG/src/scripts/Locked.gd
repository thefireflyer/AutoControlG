extends Panel

func _ready():
	_on_password_text_entered("")


func _on_password_text_entered(new_text):
	if new_text == DataLibrary.data["General"]["password"]:
		DataLibrary.is_locked = false
		name = "Settings"
		

func lock():
	if not (DataLibrary.is_locked or DataLibrary.data["General"]["password"] == ""):
		$LockScreen/password.text = ""
		name = "Locked"
		DataLibrary.is_locked = true
		get_parent().get_node("Overview/Environments")._on_environments_item_selected(DataLibrary.data["Environments"].size())
	

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		lock()
	
	$LockScreen.visible = DataLibrary.is_locked
	$Settings.visible = not DataLibrary.is_locked
	if not DataLibrary.is_locked:
		name = "Settings"

