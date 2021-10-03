extends Panel



func _on_EncryptUserFilesB_pressed():
	FunctionLibrary.encrypt_user_files()


func _on_DecryptUserFilesB_pressed():
	FunctionLibrary.decrypt_user_files()
