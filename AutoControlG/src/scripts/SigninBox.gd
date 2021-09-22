extends Control

signal loggedin

func _ready():
	connect("loggedin", get_parent(), "_on_loggedin")

func _draw():
	$Panel/Panel2/Accounts.items = configure_accounts(DataLibrary.data["public_user_accounts"])

func _on_Accounts_item_selected(index):
	$Panel/Panel/UserName.text = $Panel/Panel2/Accounts.items[index]


func _on_LogInB_pressed():
	var res = DataLibrary.load_user_config($Panel/Panel/UserName.text, $Panel/Panel/Password.text)
	if not res["res"]:
		if res["error"] == "couldn't find file":
			$ConfirmationDialog.popup_centered()
		if res["error"] == "failed to read file":
			$AcceptDialog.popup_centered()
	else:
		print("login successful")
		emit_signal("loggedin")

func _on_SignUpB_pressed():
	DataLibrary.save_user_config($Panel/Panel/UserName.text, $Panel/Panel/Password.text)

func configure_accounts(users):
	var res = []
	for user in users:
		res.append(user)
		res.append(null)
		res.append(false)
	return res


func _on_ConfirmationDialog_confirmed():
	_on_SignUpB_pressed()
	_on_LogInB_pressed()
