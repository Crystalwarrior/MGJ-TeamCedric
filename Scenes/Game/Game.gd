class_name Game
extends Node

@export var _introDialogue : DialogueResource

@onready var ui = %UI
@onready var _mainUI : MainUI = %MainUI

var dialog_balloon

var _speaked := false # just to test the evidence gather
var _playerState : PlayerState = PlayerState.new()

var is_test = false

func _ready() -> void:
	DialogueManager.get_current_scene = get_dialogue_container_scene

	_mainUI.speakButtonPressed.connect(_onSpeakButtonPressed)
	DialogueManager.dialogue_ended.connect(_onDialogueEnded)

	# Check if we're running the game as a test scene (from specific line of dialogue etc.)
	if is_test:
		# Test run
		var run_resource_path: String = DMSettings.get_user_value("run_resource_path")
		if ResourceLoader.exists(run_resource_path):
			var run_resource = load(run_resource_path)
			var run_title: String = DMSettings.get_user_value("run_title")
			play_dialogue(run_resource, run_title if not run_title.is_empty() else run_resource.first_title)


func _enter_tree() -> void:
	is_test = DMSettings.get_user_value("is_running_test_scene", false)
	DMSettings.set_user_value("is_running_test_scene", false)


# just to test the evidence gather
func _onSpeakButtonPressed() -> void:
	if not _speaked:
		play_dialogue(_introDialogue)
	_speaked = true

# just to test the evidence gather
func _onDialogueEnded(_dialogue: DialogueResource) -> void:
	var evidence1 = EvidenceDB.getItem(Enums.Evidence.Knife)
	var evidence2 = EvidenceDB.getItem(Enums.Evidence.Amnesia)
	_playerState.addEvidence(evidence1)
	_playerState.addEvidence(evidence2)
	SaveLoadManager.data.playerState = _playerState
	SaveLoadManager.save()


func get_dialogue_container_scene():
	return %DialogueContainer

func play_dialogue(dialogue: DialogueResource, label = "start", extra_game_states = []):
	dialog_balloon = DialogueManager.show_dialogue_balloon(dialogue, label, extra_game_states)
