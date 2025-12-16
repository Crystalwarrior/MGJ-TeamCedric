class_name Game
extends Node

@export var _introDialogue : DialogueResource

@onready var _mainUI : MainUI = %MainUI

var _dialog_balloon
var _speaked := false # just to test the evidence gather
var _playerState : PlayerState = PlayerState.new()
var _is_test = false


func _ready() -> void:
	_connectSignals()
	DialogueManager.get_current_scene = _get_dialogue_container_scene
	if _is_test:
		_runTestMode()
	
	# Here for quicker testing at the moment
	var evidence1 = EvidenceDB.getItem(Enums.Evidence.Knife)
	var evidence2 = EvidenceDB.getItem(Enums.Evidence.Amnesia)
	_playerState.addEvidence(evidence1)
	_playerState.addEvidence(evidence2)

func _enter_tree() -> void:
	_is_test = DMSettings.get_user_value("is_running_test_scene", false)
	DMSettings.set_user_value("is_running_test_scene", false)


func _runTestMode() -> void:
	# Check if we're running the game as a test scene (from specific line of dialogue etc.)
	var run_resource_path: String = DMSettings.get_user_value("run_resource_path")
	if ResourceLoader.exists(run_resource_path):
		var run_resource = load(run_resource_path)
		var run_title: String = DMSettings.get_user_value("run_title")
		_play_dialogue(run_resource, run_title if not run_title.is_empty() else run_resource.first_title)

func _connectSignals() -> void:
	_mainUI.speakButtonPressed.connect(_onSpeakButtonPressed)
	SignalBus.evidenceSelected.connect(_onEvidenceSelected)

func _onEvidenceSelected(_data: EvidenceItem) -> void:
	if not DialogueStateManager.isEvidencePrompt():
		return

func _onSpeakButtonPressed() -> void:
	if not _speaked:
		_play_dialogue(_introDialogue)
	_speaked = true

func _play_dialogue(dialogue: DialogueResource, label = "start", extra_game_states = []):
	_dialog_balloon = DialogueManager.show_dialogue_balloon(dialogue, label, extra_game_states)

func _get_dialogue_container_scene():
	return %DialogueContainer
