class_name Game
extends Node

@export var _introDialogueResource : DialogueResource 

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(_introDialogueResource, "start")
