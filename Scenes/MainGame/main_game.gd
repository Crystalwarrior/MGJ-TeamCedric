extends Control

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func _ready():
    DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)