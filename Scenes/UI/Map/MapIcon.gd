extends Control

@export var text : String = "This is info about the event!"

@onready var _popupPanel : PopupPanel = $PopupPanel
@onready var _popupPanelLabel : Label = $PopupPanel/Label


func _ready() -> void:
	_popupPanelLabel.text = text

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_openPopup()

func _openPopup() -> void:
	var global_pos = get_global_mouse_position()
	_popupPanel.set_position(global_pos)
	_popupPanel.popup()
