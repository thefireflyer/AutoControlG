extends Panel



#========================Variables===========================

var current_environment = null

#============================================================

#=====================Main functionality=====================
func _ready():
	configure_options(DataLibrary.environments.keys())

func _on_environments_item_selected(index):
	print(DataLibrary.environments.keys()[index]+"\n")
	current_environment = FunctionLibrary.setup_env(current_environment)
	DataLibrary.environments.values()[index].call_func(current_environment)
	


func configure_options(options):
	var res = []
	for option in options:
		res.append(option)
		res.append(null)
		res.append(false)
	$environments.items = res

#============================================================


#====================Function library========================

#============================================================
