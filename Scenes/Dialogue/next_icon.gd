extends Control


@onready var anim: AnimationPlayer = $AnimationPlayer

func next():
	anim.stop()
	anim.play("next")
