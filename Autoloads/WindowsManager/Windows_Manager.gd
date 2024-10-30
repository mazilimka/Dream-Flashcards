extends CanvasLayer

func change_window(_needs_window: String):
	match _needs_window:
		'AddWord':
			%AddWord.show()
			%Menu.hide()
		'WordList':
			%AddWord.hide()
			%Menu.hide()
		'Menu':
			%Menu.show()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("get_menu"):
		change_window('Menu')
