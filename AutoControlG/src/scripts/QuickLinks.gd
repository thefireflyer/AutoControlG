extends Panel


func _ready():
	configure_options(DataLibrary.user_data["[data]"]["Links"].keys())

func configure_options(options):
	var res = []
	for option in options:
		#res.append(option)
		#res.append("link")
		res.append(null)
		if "res://" in option:
			res.append(load(option))
		else:
			var favicon = yield(get_favicon(str(DataLibrary.user_data["[data]"]["Links"][option][0])), "completed")
			res.append(favicon)
		res.append(false)
	$links.items = res
	


func _on_links_item_selected(index):
	
	OS.window_minimized = true
	for link in DataLibrary.user_data["[data]"]["Links"].values()[index]:
		OS.shell_open(link)
	configure_options(DataLibrary.user_data["[data]"]["Links"].keys())
	
	
func get_favicon(url):
	print(url)
	print(url.find("://"))
	print(url.find("/",url.find_last("://")))
	url = url.substr(0, url.find("/",url.find("://")+3)) + "/fluidicon.png"#"/favicon.png"#
	print(url)
	var http_request = HTTPRequest.new()
	add_child(http_request)
	var res
	http_request.request(url)
	res = yield(http_request, "request_completed")
	if res[1] != 200:
		return null
	#print(typeof(res)==TYPE_ARRAY)
	var parser = XMLParser.new()
	print(parser.open_buffer(res[3]))#.get_string_from_utf8())
	print(parser.is_empty())
	print(parser.to_string())
	
	#print(res)
	var image = Image.new()
	var texture = ImageTexture.new()
	image.load_png_from_buffer(res[3])
	texture.create_from_image(image)
	#$Sprite.texture = texture
	return texture
