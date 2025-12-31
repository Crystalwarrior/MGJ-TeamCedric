extends Control

func _ready():
	AudioManager.Music.play_music("res://assets/new music/TitleTheme_Loop_290425.ogg")
	
func _gui_input(event):
	if event.is_action_just_pressed("ui_accept"):
		_on_start_button_pressed()

func _on_start_button_pressed():
	AudioManager.SFX.play_sfx("click")	
	TransitionManager.change_scene("res://Scenes/Cutscenes/intro_scene.tscn")
