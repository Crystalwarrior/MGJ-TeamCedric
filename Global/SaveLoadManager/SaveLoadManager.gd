extends Node

const FILE_PATH = "user://save_file.tres"

var data := SaveData.new()

func save() -> void:
	if not FileAccess.file_exists(FILE_PATH):
		ResourceSaver.save(data, FILE_PATH)
		if FileAccess.file_exists(FILE_PATH):
			print("Save File correctly created!")
	else:
		ResourceSaver.save(data, FILE_PATH)
		print("Save File correctly updated!")

func load() -> void:
	if not FileAccess.file_exists(FILE_PATH):
		print("No save file found. Starting game with a new file!")
		return
	data = ResourceLoader.load(FILE_PATH).duplicate(true)
	print("Save File correctly loaded!")
