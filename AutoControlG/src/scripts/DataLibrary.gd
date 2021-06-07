extends Node

var events = {
	
	"Testing" : ClassLibrary.EventNotification.new("Testing",
	"https://thefireflyer.herokuapp.com/signup/TESTING%20events%20triggered!%20AutoControlG",
	#"https://thefireflyer.herokuapp.com/",
	{"weekday":0,"hour":23,"minute":45}),
	
	"English Class" : ClassLibrary.EventNotification.new("English Class",
	 "https://us02web.zoom.us/j/81405214428?pwd=Q1V0SkgvUVMyM2tvQ0pMWDhZZmI0QT09#success",
	 {"weekday":1,"hour":11,"minute":30}),
	
	"Career Class" : ClassLibrary.EventNotification.new("Career Class",
	"https://us02web.zoom.us/j/89262347911",
	{"weekday":1,"hour":14,"minute":15}),
	
	"Chemistry Class" : ClassLibrary.EventNotification.new("Chemistry Class",
	"https://thefireflyer.herokuapp.com/signup/CHEMISTRY CLASS!%20AutoControlG",
	{"weekday":5,"hour":14,"minute":0}),
	
	"Math Class" : ClassLibrary.EventNotification.new("Math Class",
	"https://www.google.com/url?sa=D&q=https://us02web.zoom.us/j/91197322132%3Fpwd%3DdHc5T1I5eVhNUm9rbC9DeFZCL3VEZz09&ust=1621379400000000&usg=AOvVaw06by76WbDBfXnl9KEjwiWF&hl=en&source=gmail",
	{"weekday":2,"hour":10,"minute":30})
	
}

var environments = {
	
	"Programming" : funcref(FunctionLibrary, "setup_programming_env"),
	"2D art" : funcref(FunctionLibrary, "setup_art2D_env"),
	"3D art" : funcref(FunctionLibrary, "setup_art3D_env"),
	"School" : funcref(FunctionLibrary, "setup_school_env"),
	"None" : funcref(FunctionLibrary, "clear_env")
	
}


var links = {
	
	"res://assets/64284477.png" : ["https://thefireflyer.herokuapp.com/",
	 "https://flyingfire.theflyingfire.repl.co/",
	 "https://thefireflyer.wixsite.com/flyingfire"],
	
	"" : ["https://itch.io/dashboard"]
	
}

var good_music_urls = {
	
	"Civilization 6 music" : "https://www.youtube.com/watch?v=Z4ciJy3u7BY&list=PL9Xws8aTzwJDjicUyRgvNJhgIQrLvNQjv&index=1",
	"ABZU music" : "https://www.youtube.com/watch?v=ElzV4PnXM5o",
	"Ori and the Will of the Wisps music" : "https://www.youtube.com/watch?v=eCbyqm9jcBA",
	"Collection 1" : "https://www.youtube.com/watch?v=hqG8u0jsk1A",
	"Collection 2" : "https://www.youtube.com/watch?v=3TAUnYZpMbA",
	"Random 1" : "https://www.youtube.com/watch?v=jYsSd65Y-Z8",
	"Random 2" : "https://www.youtube.com/watch?v=3tRPpMQL1KE",
	"Random 3" : "https://www.youtube.com/watch?v=vEP3sGEjxhY",
	"Random 4" : "https://www.youtube.com/watch?v=Q5LU2s5wz9U"
	
}


