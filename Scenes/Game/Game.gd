class_name Game
extends Node

@export var _introDialogue : DialogueResource

@onready var ui = %UI
@onready var _mainUI : MainUI = %MainUI
@onready var run_title: String = DMSettings.get_user_value("run_title")
@onready var run_resource: DialogueResource = load(DMSettings.get_user_value("run_resource_path"))

var dialog_balloon

var _speaked := false # just to test the evidence gather
var _playerState : PlayerState = PlayerState.new()


func _ready() -> void:
	_mainUI.speakButtonPressed.connect(_onSpeakButtonPressed)
	DialogueManager.dialogue_ended.connect(_onDialogueEnded)

	# Test run
	if run_resource:
		print(run_title)
		DialogueManager.show_dialogue_balloon(run_resource, run_title if not run_title.is_empty() else run_resource.first_title)


func _enter_tree() -> void:
	DMSettings.set_user_value("is_running_test_scene", false)


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
	SaveLoadManager.data.playerState = _playerState
	SaveLoadManager.save()
