class_name EvidenceItemUI
extends Control

@onready var _icon : TextureRect = %Icon
@onready var _titleLabel : Label = %TitleLabel
@onready var _descriptionLabel : Label = %DescriptionLabel

var _data : EvidenceItem


func _ready() -> void:
	if _data == null:
		return
	
	_icon.texture = _data.icon
	_titleLabel.text = _data.title
	_descriptionLabel.text = _data.description

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_onClicked()

func AddData(data: EvidenceItem) -> void:
	_data = data

func _onClicked() -> void:
	SignalBus.evidenceSelected.emit(_data)
