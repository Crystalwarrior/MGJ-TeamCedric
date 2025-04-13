extends Node

enum State {
	Null = -1,
	Speaking,
	MultipleChoice,
	EvidencePrompt,
}

var _state : State = State.Null
var _targetEvidenceId: Enums.Evidence = Enums.Evidence.Null


func _ready() -> void:
	DialogueManager.dialogue_started.connect(_onDialogueStarted)
	SignalBus.evidenceSelected.connect(_onEvidenceSelected)


func startMultipleChoice() -> void:
	_state = State.MultipleChoice

func endMultipleChoice() -> void:
	_state = State.Speaking

func isMultipleChoice() -> bool:
	return _state == State.MultipleChoice

func startEvidencePrompt(evidenceId : Enums.Evidence) -> void:
	_targetEvidenceId = evidenceId
	_state = State.EvidencePrompt

func endEvidencePrompt() -> void:
	_state = State.Speaking

func isEvidencePrompt() -> bool:
	return _state == State.EvidencePrompt

func _onDialogueStarted(_dialogue: DialogueResource) -> void:
	_state = State.Speaking

func _onEvidenceSelected(id: Enums.Evidence) -> void:
	if id == _targetEvidenceId:
		endEvidencePrompt()
