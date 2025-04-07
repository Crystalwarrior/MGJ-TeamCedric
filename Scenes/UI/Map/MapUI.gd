# TODO Move all Slider logic and data into its own Scene
class_name MapUI
extends Control

@onready var _timeLineSlider : HSlider = %TimeLineSlider
@onready var _timeLineLabels := %TimeLineLabels

const STEPS = 8

func _ready():
	_timeLineSlider.min_value = 0
	_timeLineSlider.max_value = STEPS -1
	for i in range(STEPS):
		var label = Label.new()
		label.text = str(i) # TODO Replace with actual timestamps
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		var anchor := float(i) / (STEPS -1)
		label.anchor_left = anchor
		label.anchor_right = anchor

		_timeLineLabels.add_child(label)
