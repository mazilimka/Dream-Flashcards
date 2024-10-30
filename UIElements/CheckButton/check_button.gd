@icon('res://Assets/Themes/CheckButton.png')
extends CheckButton

func set_animation(_toggled_on: bool):
	match _toggled_on:
		true:
			$AnimationPlayer.play("On")
		false:
			$AnimationPlayer.play('Off')
