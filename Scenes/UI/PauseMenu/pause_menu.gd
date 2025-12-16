extends Control

var showing: bool = false

func toggle_menu(shouldShow: bool = true):
	if $AnimationPlayer.is_playing():
		return
	AudioManager.SFX.play_sfx("click")
	$AnimationPlayer.stop()
	if shouldShow:
		show()
		#you can also freeze/unfreeze the whole game with get_tree().paused
		#get_tree().paused = true
		showing = true
		$AnimationPlayer.play_backwards("slide_out")
		AudioManager.Music.enable_low_pass()
	else:
		#get_tree().paused = false
		showing = false
		$AnimationPlayer.play("slide_out")
		AudioManager.Music.disable_low_pass()
		await $AnimationPlayer.animation_finished
		hide()

func _on_button_pressed() -> void:
	$CardControl/Card/ResumeButton.release_focus()
	toggle_menu(false)
