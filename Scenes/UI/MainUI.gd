class_name MainUI
extends Control

signal speakButtonPressed

@onready var _pauseButton : TextureButton = %PauseButton
@onready var _slidePanel : SlidePanel = %SlidePanel

func _on_pause_button_pressed():
	AudioManager.SFX.play_sfx("click")
	get_tree().call_group("PAUSE_MENU", "toggle_menu", false)
	_pauseButton.release_focus()

func _on_open_slide_button_pressed():
	AudioManager.SFX.play_sfx("click")
	_slidePanel.toggle_panel()

func _on_speak_button_pressed() -> void:
	speakButtonPressed.emit()
