extends Control

signal continue_dialogue

@onready var icon : TextureRect = $ColorRect/Container/Icon
var evidence : EvidenceClass


func _ready():
	pass

func successfully_added_evidence():
	
	continue_dialogue.emit()
