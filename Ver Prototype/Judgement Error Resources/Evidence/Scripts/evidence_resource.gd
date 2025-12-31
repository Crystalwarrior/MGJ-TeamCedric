extends Resource
class_name EvidenceClass

@export var evidence_name : String = "NONE"
@export var evidence_image : Texture2D

@export_multiline var evidence_description : String = "THERE IS NO DESCRIPTION"
@export var evidence_notes : Array[EvidenceNoteClass]
