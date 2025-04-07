class_name PlayerState
extends Resource

var evidenceItems : Array[EvidenceItem] = []

func addEvidence(evidence: EvidenceItem) -> void:

	evidenceItems.append(evidence)
	SignalBus.playerEvidenceChanged.emit(evidenceItems)
