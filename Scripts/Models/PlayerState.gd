class_name PlayerState
extends Resource

@export var _evidenceItems : Array[EvidenceItem] = []

func addEvidence(evidence: EvidenceItem) -> void:
	if _evidenceItems.has(evidence):
		push_warning("Trying to add already existing evidence to the Player State with title: ", evidence.title)
		return
	_evidenceItems.append(evidence)
	SignalBus.playerEvidenceChanged.emit(_evidenceItems)

func getEvidenceItems() -> Array[EvidenceItem]:
	return _evidenceItems.duplicate()
