class_name Game
extends Node

@export var _introDialogue : DialogueResource

@onready var ui = %UI

@onready var _mainUI : MainUI = %MainUI

var _speaked := false # just to test the evidence gather

var _playerState : PlayerState = PlayerState.new()

var dialog_balloon

func _ready() -> void:
	_mainUI.speakButtonPressed.connect(_onSpeakButtonPressed)
	DialogueManager.dialogue_ended.connect(_onDialogueEnded)

# just to test the evidence gather
func _onSpeakButtonPressed() -> void:
	if not _speaked:
		var extra_game_states = []
		dialog_balloon = DialogueManager.show_dialogue_balloon(_introDialogue, "start", extra_game_states)
		# Move the dialog box before everything
		ui.add_child(dialog_balloon)
		ui.move_child(dialog_balloon, 0)
	_speaked = true

# just to test the evidence gather
func _onDialogueEnded(dialogue: DialogueResource) -> void:
	var evidence1 = EvidenceDB.getItem(Enums.Evidence.Knife)
	var evidence2 = EvidenceDB.getItem(Enums.Evidence.Amnesia)
	_playerState.addEvidence(evidence1)
	_playerState.addEvidence(evidence2)
