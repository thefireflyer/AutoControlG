extends Panel



#========================Variables===========================

var current_environment = null
var local_environments = {}

#============================================================

#=====================Main functionality=====================
func _ready():
	
	local_environments = DataLibrary.environments
	local_environments["None"] = {}
	configure_options()

func _on_environments_item_selected(index):
	print(local_environments.keys()[index]+"\n")
	current_environment = FunctionLibrary.setup_env(current_environment, local_environments.values()[index])
	#DataLibrary.environments.values()[index].call_func(current_environment)
	


func configure_options():
	
	var res = []
	for option in local_environments.keys():
		res.append(option)
		res.append(null)
		res.append(false)
	$environments.items = res

#============================================================


#====================Function library========================

#============================================================
