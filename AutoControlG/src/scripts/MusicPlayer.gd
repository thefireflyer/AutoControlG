extends Panel

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
var currently_playing = null

func _ready():
	_on_next_pressed()


func _on_next_pressed():
	
	#good_music_urls["Civilization 6 music"][good_music_urls["Civilization 6 music"].length()-1] = str(int(rand_range(0,50)))
	
	
	currently_playing = good_music_urls.keys()[int(rand_range(0,good_music_urls.size()))]
	OS.shell_open(good_music_urls[currently_playing])
	$label.text = "Currently playing: " + currently_playing
