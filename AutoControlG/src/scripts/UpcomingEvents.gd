extends Panel

var current_upcoming_event = null

var upcoming_events = []

func _ready():
	upcoming_events = DataLibrary.user_data["[data]"]["Events"].keys()
	run()


func run():
	while true:
		#sort all of the upcoming events for today
		
		upcoming_events.sort_custom(self, "sort_events")
		
		if upcoming_events.size() < 1:
			#TODO: add next week notifications
			$link.text = "nothing"
			return
		
		$link.text = upcoming_events[0] + "       in "
		
		var time_till_next_event = get_minutes_till(DataLibrary.user_data["[data]"]["Events"][upcoming_events[0]]["time"])
		
		if time_till_next_event < 0:
			#upcoming_events.append(upcoming_events[0])
			upcoming_events.pop_front()
			print("already happened")
		else:
			print(upcoming_events)
			
			var days_till_next_event = 0
			var hours_till_next_event = 0
			var minutes_till_next_event = time_till_next_event
			
			while minutes_till_next_event/60 >= 1:
				hours_till_next_event += 1
				minutes_till_next_event -= 60
			
			while hours_till_next_event/24 >= 1:
				days_till_next_event += 1
				hours_till_next_event -= 24
			
			
			print(str(days_till_next_event)+" days " + str(hours_till_next_event)+" hours "+str(minutes_till_next_event)+" minutes")
			
			$link.text += str(days_till_next_event)+" days " + str(hours_till_next_event)+" hours "+str(minutes_till_next_event)+" minutes"
			
			
			if time_till_next_event < 5 and time_till_next_event > 0:
				print("event occuring")
				_on_link_pressed()
				
				upcoming_events.pop_front()
			else:
				print("finished calculating")
				yield(get_tree().create_timer(60), "timeout")

func get_minutes_till(event_time):
	print(event_time)
	var current_time = OS.get_datetime()
	var minutes_till = 0
	if event_time.has("day"):
		minutes_till = (int(event_time["day"][0])-current_time["day"])*24*60
		if minutes_till < 0:
			minutes_till = (event_time["day"][0]+365.25 -current_time["day"])*24*60
	
	else:
		minutes_till = (event_time["weekday"][0]-current_time["weekday"])*24*60
		if minutes_till < 0:
			minutes_till = (event_time["weekday"][0]+7 -current_time["weekday"])*24*60
	
	
	minutes_till += (int(event_time["hour"][0]) -current_time["hour"])*60
	minutes_till += int(event_time["minute"][0]) -current_time["minute"]
	return minutes_till


func sort_events(a, b):
	
	var a_time = DataLibrary.user_data["[data]"]["Events"][a]["time"]
	var b_time = DataLibrary.user_data["[data]"]["Events"][b]["time"]
	
	var minutes_till_a = get_minutes_till(a_time)
	var minutes_till_b = get_minutes_till(b_time)
	
	if (minutes_till_a < minutes_till_b and minutes_till_a >= 0 ) or minutes_till_b < 0:
		return true
	else:
		return false


func _on_link_pressed():
	if upcoming_events.size() < 1:
		return
	for link in DataLibrary.user_data["[data]"]["Events"][upcoming_events[0]]["links"]:
		OS.shell_open(link)
	#OS.shell_open(DataLibrary.events[upcoming_events[0]].link)
