extends Panel



#========================Variables===========================

var current_environment = null
var local_environments = {}

var last_lock_state = true

#============================================================

#=====================Main functionality=====================
func _process(delta):
	if DataLibrary.is_locked != last_lock_state:
		_draw()
		last_lock_state = DataLibrary.is_locked


func _draw():
	local_environments = DataLibrary.user_data["[data]"]["Environments"].duplicate()
	local_environments["None"] = {"locked":"false"}
	configure_options()
	

func _on_environments_item_selected(index):
	print(local_environments.keys()[index]+"\n")
	current_environment = FunctionLibrary.setup_env(current_environment, local_environments.values()[index])
	#DataLibrary.environments.values()[index].call_func(current_environment)
	


func configure_options():
	
	var res = []
	for option in local_environments.keys():
		if (not local_environments[option]["locked"] == "True") or not DataLibrary.is_locked:
			res.append(option)
			res.append(null)
			res.append(false)
	$environments.items = res

#============================================================
