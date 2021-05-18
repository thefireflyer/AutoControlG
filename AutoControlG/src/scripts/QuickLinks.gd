extends Panel

var links = {
	
	"res://assets/64284477.png" : ["https://thefireflyer.herokuapp.com/",
	 "https://flyingfire.theflyingfire.repl.co/",
	 "https://thefireflyer.wixsite.com/flyingfire"],
	
	"" : ["https://itch.io/dashboard"]
	
}

func _ready():
	configure_options(links.keys())

func configure_options(options):
	var res = []
	for option in options:
		#res.append(option)
		res.append("")
		#res.append(null)
		
		res.append(load(option))
		res.append(false)
	$links.items = res
	


func _on_links_item_selected(index):
	OS.window_minimized = true
	for link in links.values()[index]:
		OS.shell_open(link)
	configure_options(links.keys())
	
	
