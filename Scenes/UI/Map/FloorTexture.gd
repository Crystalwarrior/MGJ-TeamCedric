class_name FloorTexture
extends TextureRect

@onready var _timeline1Icons : Control = $Timeline1Icons
@onready var _timeline2Icons : Control = $Timeline2Icons
@onready var _timeline3Icons : Control = $Timeline3Icons
@onready var _timeline4Icons : Control = $Timeline4Icons

@onready var _iconsById : Dictionary[int, Control] = {
	0 : _timeline1Icons,
	1 : _timeline2Icons,
	2 : _timeline3Icons,
	3 : _timeline4Icons,
}

var _floorOwnerId : int


func _ready() -> void:
	for icons in _iconsById.values():
		icons.hide()
	_iconsById.get(0).show()

func showIcons(id: int) -> void:
	var targetIcons : Control = _iconsById.get(id)
	if targetIcons == null:
		push_error("Floor Texture with id ", _floorOwnerId," being called to set a group of icons that doesnt exist with id ", id)
	for icons in _iconsById.values():
		icons.hide()
	targetIcons.show()

func setOwnerId(id: int) -> void:
	_floorOwnerId = id 
