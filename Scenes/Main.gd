extends Node


func _ready() -> void:
	EvidenceDB.loadData()
	TransitionManager.change_scene("res://Scenes/MainMenu/MainMenu.tscn")
