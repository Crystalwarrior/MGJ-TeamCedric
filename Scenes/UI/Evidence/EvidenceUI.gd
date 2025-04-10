# TODO add proper data management
class_name EvidenceUI
extends Control


@onready var rows : VBoxContainer = %Rows

var _evidenceItemUI = preload("res://Scenes/UI/Evidence/EvidenceItemUI.tscn")

func _ready() -> void:
	SignalBus.playerEvidenceChanged.connect(_onPlayerEvidenceChanged)
	_applyState(SaveLoadManager.data)


func _applyState(data: SaveData) -> void:
	_populateItems(data.playerState.getEvidenceItems())

func _populateItems(evidenceItems: Array[EvidenceItem]):
	for child in rows.get_children():
		child.queue_free()
	for i in range(0, evidenceItems.size(), 2):
		var hbox = HBoxContainer.new()
		hbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL

		for j in range(2):
			var index = i + j
			var node: Control
			if index < evidenceItems.size():
				node = _evidenceItemUI.instantiate()
				node.AddData(evidenceItems[index])
			else:
				node = Control.new()  # phantom node to fill up space
			node.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			hbox.add_child(node)

		rows.add_child(hbox)


func _onPlayerEvidenceChanged(evidenceItems: Array[EvidenceItem]) -> void:
	_populateItems(evidenceItems)
