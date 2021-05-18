extends Node

class EventNotification:
	var name
	var link
	var time
	func _init(name, link, time):
		self.name = name
		self.link = link
		self.time = time
	

class AppEnvironment:
	var open_apps = []
	
	func _init():
		pass
	
	func launch(apps, args = []):
		for app in apps:
			var tmp = OS.execute(app, args, false)
			print(tmp)
			open_apps.append(tmp)
		OS.window_minimized = true
	
	func close():
		for app in open_apps:
			print(OS.kill(app))
		open_apps = []
	
