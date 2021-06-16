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
	currently_playing = DataLibrary.good_music_urls.keys()[rand.randi_range(0,DataLibrary.good_music_urls.size())]
	OS.shell_open(DataLibrary.good_music_urls[currently_playing])
	$label.text = "Currently playing: " + currently_playing
