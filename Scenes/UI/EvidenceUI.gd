# TODO add proper data management
class_name EvidenceUI
extends Control


@onready var rows : VBoxContainer = %Rows

var _evidenceItem = preload("res://Scenes/UI/EvidenceItem.tscn")

func _ready() -> void:
	populate_items([1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,1,2,3,4,5,6])

func populate_items(data_array):
	for child in rows.get_children():
		child.queue_free()
	for i in range(0, data_array.size(), 2):
		var hbox = HBoxContainer.new()
		hbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL

		for j in range(2):
			var index = i + j
			var node: Control
			if index < data_array.size():
				node = _evidenceItem.instantiate()
			else:
				node = Control.new()  # phantom node
			node.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			hbox.add_child(node)

		rows.add_child(hbox)
