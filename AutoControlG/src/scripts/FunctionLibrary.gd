extends Node

#==================Environments==============================
func setup_env(current_environment, new_environment_data):
	if current_environment != null:
		current_environment.close()
	
	var new_environment = ClassLibrary.AppEnvironment.new()
	
	if new_environment_data.has("apps"):
		new_environment.launch(new_environment_data["apps"])
	
	if new_environment_data.has("links"):
		for link in new_environment_data["links"]:
			OS.shell_open(link)
	
	if new_environment_data.has("music"):
		#TODO: implement environment specific music
		pass
	
	return new_environment


#============================================================


#====================encryption stuff========================
func encrypt_user_files():
	print("encrypting")
	if DataLibrary.user_files_encrypted:
		print("already encrypted")
		return
	
	if not DataLibrary.user_data["[data]"].has("encrypted_user_folders"):
		print("no folders to encrypt")
		return
	
	for folder in DataLibrary.user_data["[data]"]["encrypted_user_folders"]:
		print(folder)
		var files = []
		get_files(folder, files)
		print(files)
		for file in files:
			encrypt_file(file)
		
		print("encrypting user files")
		
	
	DataLibrary.user_files_encrypted = true


func decrypt_user_files():
	print("decrypting")
	if not DataLibrary.user_files_encrypted:
		print("already decrypted")
		return
	
	if not DataLibrary.user_data["[data]"].has("encrypted_user_folders"):
		print("no folders to decrypt")
		return
	
	for folder in DataLibrary.user_data["[data]"]["encrypted_user_folders"]:
		print(folder)
		var files = []
		get_files(folder, files)
		print(files)
		for file in files:
			decrypt_file(file)
		
		print("decrypting user files")
		
	
	DataLibrary.user_files_encrypted = false
	
func get_files(path, files):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				#print("Found directory: " + file_name)
				if (not ("." in file_name)) and file_name != "":
					#print("sub")
					#print(path+"/"+file_name)
					get_files(path+"/"+file_name, files)
			else:
				print("Found file: " + file_name)
				files.append(path+"/"+file_name)
				
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
		

func encrypt_file(path):
	var file = File.new()
	file.open(path, File.READ)
	var contents = file.get_buffer(file.get_len())
	file.close()
	
	print(contents.size())
	if contents.size() < 1:
		print("failed to read file")
		return
	file.open_encrypted_with_pass(path, File.WRITE, DataLibrary.user_data["password"])
	
	file.store_buffer(contents)
	
	file.close()

func decrypt_file(path):
	
	var file = File.new()
	file.open_encrypted_with_pass(path, File.READ, DataLibrary.user_data["password"])
	
	var contents = file.get_buffer(file.get_len())
	
	file.close()
	print(contents.size())
	if contents.size() < 1:
		print("failed to read file")
		return
	file.open(path, File.WRITE)
	
	file.store_buffer(contents)
	
	file.close()

#============================================================
