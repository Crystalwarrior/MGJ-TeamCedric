class_name Cutscene
extends Game

func _ready() -> void:
	_connectSignals()
	DialogueManager.get_current_scene = _get_dialogue_container_scene
	
	if _is_test:
		_runTestMode()
	
	# Here for quicker testing at the moment
	#var evidence1 = EvidenceDB.getItem(Enums.Evidence.Knife)
	#var evidence2 = EvidenceDB.getItem(Enums.Evidence.Amnesia)
	#_playerState.addEvidence(evidence1)
	#_playerState.addEvidence(evidence2)
	
	_mainUI.speakButtonPressed.emit()
