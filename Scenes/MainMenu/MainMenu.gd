extends Control


func _input(event):
	if visible and Input.is_action_just_pressed("ui_accept"):
		_on_start_button_pressed()

func _on_start_button_pressed():
	AudioManager.SFX.play_sfx("click")	
	TransitionManager.change_scene("res://Scenes/Game/Game.tscn")
