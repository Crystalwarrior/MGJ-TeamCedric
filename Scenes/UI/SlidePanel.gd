# TODO Solve issue of children sometimes having a delay in the animation (like with the map TextureRect)
class_name SlidePanel
extends Control


var _isOpen : bool = false


func _ready():
	_getTargetWidth()
	offset_left = 0
	offset_right = _getTargetWidth()

func toggle_panel():
	_isOpen = !_isOpen
	_animateSlide(_isOpen)

func _getTargetWidth() -> float:
	return get_viewport_rect().size.x * 2.0 / 3.0

func _animateSlide(isOpening: bool):
	var targetWidth = _getTargetWidth()

	var target_left = - targetWidth if isOpening else 0
	var target_right = 0 if isOpening else targetWidth

	var tween: Tween = create_tween()
	tween.tween_property(self, "offset_left", target_left, 0.4).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "offset_right", target_right, 0.4).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
