extends Node

enum State {
	Null = -1,
	Speaking,
	EvidencePrompt,
}
var _state : State = State.Null

func _ready() -> void:
	DialogueManager.dialogue_started.connect(_onDialogueStarted)
	SignalBus.evidenceSelected.connect(_onEvidenceSelected)

func startEvidencePrompt() -> void:
	_state = State.EvidencePrompt
	SignalBus.evidencePrompt.emit(true)

func endEvidencePrompt() -> void:
	_state = State.Speaking
	SignalBus.evidencePrompt.emit(false)

func isEvidencePrompt() -> bool:
	return _state == State.EvidencePrompt

func _onDialogueStarted(_dialogue: DialogueResource) -> void:
	_state = State.Speaking

func _onEvidenceSelected(evidence: EvidenceItem) -> void:
	print(evidence.title)
