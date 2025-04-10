extends Node


func _ready() -> void:
	EvidenceDB.loadData()
	SaveLoadManager.load()
	TransitionManager.change_scene("res://Scenes/MainMenu/MainMenu.tscn")
