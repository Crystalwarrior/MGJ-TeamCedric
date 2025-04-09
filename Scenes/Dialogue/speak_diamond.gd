extends Control


@onready var anim: AnimationPlayer = $AnimationPlayer

func spin():
	anim.stop()
	anim.play("spin")
