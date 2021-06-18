extends Panel


var currently_playing = null

func _ready():
	pass
	#_on_next_pressed()


func _on_next_pressed():
	
	#good_music_urls["Civilization 6 music"][good_music_urls["Civilization 6 music"].length()-1] = str(int(rand_range(0,50)))
	
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	#print(rand.randi_range(0,DataLibrary.good_music_urls.size()))
	currently_playing = DataLibrary.data["Music"].keys()[rand.randi_range(0,DataLibrary.data["Music"].size())]
	OS.shell_open(DataLibrary.data["Music"][currently_playing][0])
	$label.text = "Currently playing: " + currently_playing
