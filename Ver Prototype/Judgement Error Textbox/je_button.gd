extends Control
class_name TextboxButton

@export var label_text : String


@onready var button : Button = get_node("Button")
@onready var button_label : Label = get_node("Label")

func _ready():
	button_label.text = str(label_text)

func activate_button():
	pass

func _on_button_pressed():
	activate_button()
