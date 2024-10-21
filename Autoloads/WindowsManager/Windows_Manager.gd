extends CanvasLayer

func change_window(_needs_window: String):
	match _needs_window:
		'AddWord':
			%AddWord.show()
		'WordList':
			%AddWord.hide()
