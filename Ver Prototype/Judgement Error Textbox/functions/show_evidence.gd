extends TextboxButton

const EVIDENCE_MENU : PackedScene = preload("res://Judgement Error Resources/Evidence/Evidence Menu.tscn")
var active : bool = false


func activate_button():
	if active == false:
		var menu = EVIDENCE_MENU.instantiate()
		add_child(menu)
		print("Showing menu")
		
		active = true
		
		
