class_name MapUI
extends Control

@onready var _mapDrawing : MapDrawing = %MapDrawing

func _on_h_labeled_slider_value_changed(value: float) -> void:
	_mapDrawing.setCurrentTimeline(int(value))

func _on_v_labeled_slider_value_changed(value: float) -> void:
	_mapDrawing.setCurrentFloor(int(value))
