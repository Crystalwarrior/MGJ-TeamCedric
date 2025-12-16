class_name MainUI
extends Control

signal speakButtonPressed

@onready var _pauseButton : TextureButton = %PauseButton
@onready var _slidePanel : SlidePanel = %SlidePanel
@onready var _pause_menu : Control = %PauseMenu

func _ready():
	SignalBus.evidencePrompt.connect(_on_evidence_prompt)

func _on_pause_button_pressed():
	_pause_menu.toggle_menu(not _pause_menu.showing)
	_pauseButton.release_focus()

func _on_open_slide_button_pressed():
	AudioManager.SFX.play_sfx("click")
	_slidePanel.set_panel(not _slidePanel.is_open)

func _on_speak_button_pressed() -> void:
	speakButtonPressed.emit()

func _on_evidence_prompt(toggle: bool) -> void:
	if toggle:
		_slidePanel.set_panel(true)
		%TabContainer.current_tab = 0
	else:
		_slidePanel.set_panel(false)
