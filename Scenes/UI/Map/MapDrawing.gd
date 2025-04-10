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


func _ready() -> void:
	for id in _floorById.keys():
		var floor = _floorById[id] as FloorTexture
		floor.setOwnerId(id)
		floor.hide()
	_currentFloorId = 0
	_floorById.get(0).show()

func setCurrentFloor(id: int) -> void:
	var targetFloor : FloorTexture = _floorById.get(id)
	if targetFloor == null:
		push_error("Map Drawing being called to set a floor that doesnt exist with id ", id)
	_currentFloorId = id
	for floor in _floorById.values():
		floor.hide()
	targetFloor.show()

func setCurrentTimeline(id: int) -> void:
	var floor : FloorTexture = _floorById.get(_currentFloorId) as FloorTexture
	floor.showIcons(id)
