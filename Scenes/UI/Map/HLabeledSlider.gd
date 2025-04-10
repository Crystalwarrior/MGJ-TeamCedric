class_name HLabeledSlider
extends Control

signal valueChanged(value: float)

@onready var _slider : HSlider = %Slider
@onready var _sliderLabels := %SliderLabels

const STEPS = 4

func _ready():
	_slider.min_value = 0
	_slider.max_value = STEPS -1
	for i in range(STEPS):
		var label = Label.new()
		label.text = str(i) # TODO Replace with actual timestamps
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		var anchor := float(i) / (STEPS -1)
		label.anchor_left = anchor
		label.anchor_right = anchor

		_sliderLabels.add_child(label)


func _on_slider_value_changed(value: float) -> void:
	valueChanged.emit(value)
