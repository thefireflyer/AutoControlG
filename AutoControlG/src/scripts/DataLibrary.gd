extends Node

var events = {
	
	"Testing" : ClassLibrary.EventNotification.new("Testing",
	"https://thefireflyer.herokuapp.com/",
	{"weekday":1,"hour":18,"minute":2}),
	
	"English Class" : ClassLibrary.EventNotification.new("English Class",
	 "https://us02web.zoom.us/j/81405214428?pwd=Q1V0SkgvUVMyM2tvQ0pMWDhZZmI0QT09#success",
	 {"weekday":1,"hour":11,"minute":30}),
	
	"Career Class" : ClassLibrary.EventNotification.new("Career Class",
	"https://us02web.zoom.us/j/89262347911",
	{"weekday":1,"hour":14,"minute":15}),
	
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
