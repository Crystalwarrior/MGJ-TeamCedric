class_name MapDrawing
extends Control

@onready var _floor1Texture : FloorTexture = %Floor1Texture
@onready var _floor2Texture : FloorTexture = %Floor2Texture
@onready var _floor3Texture : FloorTexture = %Floor3Texture
@onready var _floor4Texture : FloorTexture = %Floor4Texture

@onready var _floorById : Dictionary[int, FloorTexture] = {
	0 : _floor1Texture,
	1 : _floor2Texture,
	2 : _floor3Texture,
	3 : _floor4Texture,
}

var _currentFloorId : int 
var _currentTimelineId : int


func _ready() -> void:
	for id in _floorById.keys():
		var floorTexture = _floorById[id] as FloorTexture
		floorTexture.setOwnerId(id)
		floorTexture.hide()
	_currentFloorId = 0
	_currentTimelineId = 0
	_floorById.get(0).show()

func setCurrentFloor(id: int) -> void:
	var targetFloorTexture : FloorTexture = _floorById.get(id)
	if targetFloorTexture == null:
		push_error("Map Drawing being called to set a floor that doesnt exist with id ", id)
	_currentFloorId = id
	for floorTexture in _floorById.values():
		floorTexture.hide()
	targetFloorTexture.show()
	setCurrentTimeline(_currentTimelineId)

func setCurrentTimeline(id: int) -> void:
	_currentTimelineId = id
	var floorTexture : FloorTexture = _floorById.get(_currentFloorId) as FloorTexture
	floorTexture.showIcons(id)
