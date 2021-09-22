extends Node

var user_data = {
	"username":null,
	"password":null,
	"[data]":#this is the user data that should be saved and loaded
		{
		"public_user":"true",
		"Environments" : {
		
			"Testing1" : {
				"apps" : ["C:/Program Files/Blender Foundation/Blender 2.92/blender.exe", "C:/Program Files/Krita (x64)/bin/krita.exe"],
				"locked" : "false"
			},
			
			"Testing2" : {
				"apps" : ["C:/Program Files/Krita (x64)/bin/krita.exe"],
				"links" : ["https://itch.io/dashboard"],
				"music" : {},
				"locked" : "false"
			},
			
			"exampleLockedEnv" : {
					"apps" : ["C:/Program Files/PureRef/PureRef.exe"],
					"locked" : "True"
				},
		},

		"Links" : {
			
			#TODO: update to .json configurable
			"" : ["https://github.com"],
			
			"gf" : ["https://itch.io"],
			
			"res://assets/64284477.png" : ["https://thefireflyer.herokuapp.com",
			 "https://flyingfire.theflyingfire.repl.co",
			 "https://thefireflyer.wixsite.com/flyingfire"],
			
			
			
		},
		
		
		"Music" : {
			
			"Civilization 6 music" : ["https://www.youtube.com/watch?v=Z4ciJy3u7BY&list=PL9Xws8aTzwJDjicUyRgvNJhgIQrLvNQjv&index=1"],
			"ABZU music" : ["https://www.youtube.com/watch?v=ElzV4PnXM5o"],
			"Ori and the Will of the Wisps music" : ["https://www.youtube.com/watch?v=eCbyqm9jcBA"],
			"Collection 1" : ["https://www.youtube.com/watch?v=hqG8u0jsk1A"],
			"Collection 2" : ["https://www.youtube.com/watch?v=3TAUnYZpMbA"],
			"Random 1" : ["https://www.youtube.com/watch?v=jYsSd65Y-Z8"],
			"Random 2" : ["https://www.youtube.com/watch?v=3tRPpMQL1KE"],
			"Random 3" : ["https://www.youtube.com/watch?v=vEP3sGEjxhY"],
			"Random 4" : ["https://www.youtube.com/watch?v=Q5LU2s5wz9U"]
			
		},
		
		"Events" : {
			
			"Testing" : {
				"links" : ["https://thefireflyer.herokuapp.com/signup/TESTING%20events%20triggered!%20AutoControlG"],
				"time" : {"weekday":[2],"hour":[15],"minute":[00]}
			},
			
			"Testing2" : {
				"links" : ["https://thefireflyer.herokuapp.com/signup/TEST2%20events%20triggered!%20AutoControlG"],
				"time" : {"hour":[23],"minute":[30], "day": [15]}
			},
			
		}
		}
	}

var is_locked = true
var data = {
	
	
	"public_user_accounts" : [],
	
	"app_data" : {	
		"version" : "1.1.0-pre_release",
		"maximize" : "false"
	},
	
	"[deprecated]" : {
		"version" : "1.0.0",
		
		"General" : {
			"password" : "",
			"maximize" : "false",
		},
		
		"Environments" : {
		
			"Testing1" : {
				"apps" : ["C:/Program Files/Blender Foundation/Blender 2.92/blender.exe", "C:/Program Files/Krita (x64)/bin/krita.exe"],
				"locked" : "false"
			},
			
			"Testing2" : {
				"apps" : ["C:/Program Files/Krita (x64)/bin/krita.exe"],
				"links" : ["https://itch.io/dashboard"],
				"music" : {},
				"locked" : "false"
			},
			
			"exampleLockedEnv" : {
					"apps" : ["C:/Program Files/PureRef/PureRef.exe"],
					"locked" : "True"
				},
		},

		"Links" : {
			
			#TODO: update to .json configurable
			"" : ["https://github.com"],
			
			"gf" : ["https://itch.io"],
			
			"res://assets/64284477.png" : ["https://thefireflyer.herokuapp.com",
			 "https://flyingfire.theflyingfire.repl.co",
			 "https://thefireflyer.wixsite.com/flyingfire"],
			
			
			
		},
		
		
		"Music" : {
			
			"Civilization 6 music" : ["https://www.youtube.com/watch?v=Z4ciJy3u7BY&list=PL9Xws8aTzwJDjicUyRgvNJhgIQrLvNQjv&index=1"],
			"ABZU music" : ["https://www.youtube.com/watch?v=ElzV4PnXM5o"],
			"Ori and the Will of the Wisps music" : ["https://www.youtube.com/watch?v=eCbyqm9jcBA"],
			"Collection 1" : ["https://www.youtube.com/watch?v=hqG8u0jsk1A"],
			"Collection 2" : ["https://www.youtube.com/watch?v=3TAUnYZpMbA"],
			"Random 1" : ["https://www.youtube.com/watch?v=jYsSd65Y-Z8"],
			"Random 2" : ["https://www.youtube.com/watch?v=3tRPpMQL1KE"],
			"Random 3" : ["https://www.youtube.com/watch?v=vEP3sGEjxhY"],
			"Random 4" : ["https://www.youtube.com/watch?v=Q5LU2s5wz9U"]
			
		},
		
		"Events" : {
			
			"Testing" : {
				"links" : ["https://thefireflyer.herokuapp.com/signup/TESTING%20events%20triggered!%20AutoControlG"],
				"time" : {"weekday":[2],"hour":[15],"minute":[00]}
			},
			
			"Testing2" : {
				"links" : ["https://thefireflyer.herokuapp.com/signup/TEST2%20events%20triggered!%20AutoControlG"],
				"time" : {"hour":[23],"minute":[30], "day": [15]}
			},
			
		}
	}
}
var backup = data.duplicate()


func load_user_config(username, password):
	
	var config_file = File.new()
	if not config_file.file_exists("user://users/"+username):
		print("No save file :(")
		return {"res":false, "error":"couldn't find file"}
		
	config_file.open_encrypted_with_pass("user://users/"+username, File.READ, password)
	#config_file.open("user://users/"+username, File.READ)
	
	user_data["[data]"] = JSON.parse(config_file.get_as_text()).result
	print(user_data)
	config_file.close()
	if user_data["[data]"] == null:
		print("wrong password or failed to decrypt/open user config file")
		return {"res":false, "error":"failed to read file"}
	
	user_data["username"] = username
	user_data["password"] = password
	return {"res":true, "error":""}


func save_user_config(username=user_data["username"], password=user_data["password"]):
	var dir = Directory.new()
	if not dir.dir_exists("user://users/"):
		dir.make_dir("user://users/")
	var config_file = File.new()
	config_file.open_encrypted_with_pass("user://users/"+username, File.WRITE, password)
	#config_file.open("user://users/"+username, File.WRITE)
	
	config_file.store_line(to_json(user_data["[data]"]))
	
	config_file.close()
	
	
	print("save complete")
	if user_data["[data]"]["public_user"] and not (username in data["public_user_accounts"]):
		data["public_user_accounts"].append(username)
		save_config()

func load_config():
	
	var config_file = File.new()
	if not config_file.file_exists("user://config"):
		print("No save file :(")
		return false
		
	config_file.open("user://config", File.READ)
	
	data = JSON.parse(config_file.get_as_text()).result
	#print(data)
	config_file.close()
	return true
	

func save_config():
	var config_file = File.new()
	config_file.open("user://config", File.WRITE)
	
	config_file.store_line(to_json(data))
	
	config_file.close()

func reset_config():
	print(data)
	data = backup
	save_config()

#[deprecated]
func verify_config():
	if not "General" in data:
		print("failed to load general settings")
		return false
	
	if not "Environments" in data:
		print("failed to load environments")
		return false
	
	if not "Links" in data:
		print("failed to load links")
		return false
	
	if not "Music" in data:
		print("failed to load music")
		return false
	
	if not "Events" in data:
		print("failed to load events")
		return false
	
	
	return true
