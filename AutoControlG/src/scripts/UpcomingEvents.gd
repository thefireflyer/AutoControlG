extends Panel

var current_upcoming_event = null

var upcoming_events = []

func _ready():
	upcoming_events = DataLibrary.events.keys()
	run()


func run():
	while true:
		#sort all of the upcoming events for today
		
		upcoming_events.sort_custom(self, "sort_events")
		
		$link.text = upcoming_events[0] + "       in "
		var current_time = OS.get_datetime()
		var time_till_next_event = 0
		time_till_next_event += (DataLibrary.events[upcoming_events[0]].time["weekday"] -current_time["weekday"])*24*60
		#$link.text += " days "
		time_till_next_event += (DataLibrary.events[upcoming_events[0]].time["hour"] -current_time["hour"])*60
		#$link.text += " hours "
		time_till_next_event += DataLibrary.events[upcoming_events[0]].time["minute"] - current_time["minute"]
		#$link.text += " minutes"
		$link.text += str(time_till_next_event) + " minutes"
		
		print(upcoming_events)
		
		if time_till_next_event < 5:
			_on_link_pressed()
			upcoming_events.pop_front()
		else:
		
			yield(get_tree().create_timer(60), "timeout")

func sort_events(a, b):
	var current_time = OS.get_datetime()
	
	var a_time = DataLibrary.events[a].time
	var b_time = DataLibrary.events[b].time
	
	var minutes_till_a = 0
	var minutes_till_b = 0
	
	minutes_till_a += (a_time["weekday"] -current_time["weekday"])*24*60
	minutes_till_a += (a_time["hour"] -current_time["hour"])*60
	minutes_till_a += a_time["minute"] - current_time["minute"]
	
	
	minutes_till_b += (b_time["weekday"] -current_time["weekday"])*24*60
	minutes_till_b += (b_time["hour"] -current_time["hour"])*60
	minutes_till_b += b_time["minute"] -current_time["minute"]
	
	
	if (minutes_till_a < minutes_till_b and minutes_till_a >= 0 ) or minutes_till_b < 0:
		return true
	else:
		return false

func _on_link_pressed():
	OS.shell_open(DataLibrary.events[upcoming_events[0]].link)
