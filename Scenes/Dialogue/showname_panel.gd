extends Control

@onready var showname_label = %ShownameLabel
@onready var speak_diamond = %SpeakDiamond

func set_showname(showname: String):
	showname_label.text = showname
	set_visible(not showname.is_empty())
	# update label size to match the showname size
	if visible:
		await get_tree().process_frame
		reset_size()
