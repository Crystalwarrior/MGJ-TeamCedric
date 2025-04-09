@tool
extends RichTextLabel

func _ready() -> void:
	finished.connect(_on_rich_text_label_finished)


func _on_rich_text_label_finished() -> void:
	await get_tree().process_frame
	reset_size()
