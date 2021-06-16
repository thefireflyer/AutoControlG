extends Node

var events = {
	
	"Testing" : ClassLibrary.EventNotification.new("Testing",
	"https://thefireflyer.herokuapp.com/signup/TESTING%20events%20triggered!%20AutoControlG",
	#"https://thefireflyer.herokuapp.com/",
	{"weekday":1,"hour":23,"minute":45}),
	
	"Testing 2" : ClassLibrary.EventNotification.new("Testing 2",
	"https://thefireflyer.herokuapp.com/signup/tests2%20events%20triggered!%20AutoControlG",
	#"https://thefireflyer.herokuapp.com/",
	{"hour":23,"minute":30, "day": 15}),
	
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


