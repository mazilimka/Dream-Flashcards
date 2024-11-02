extends CanvasLayer


var CurrentWindow

func _ready() -> void:
	%AddWordButton.pressed.connect(_on_add_word_pressed)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("get_menu"):
		#if CurrentWindow == 'WordListScreen':
			change_window('Menu')


func change_window(_needs_window: String):
	match _needs_window:
		'AddWord':
			%AddWord.show()
			%Menu.hide()
			%AddWordButton.hide()
			%WordMenu.close()
			CurrentWindow = 'AddWord'
		'WordListScreen':
			%AddWord.hide()
			%Menu.hide()
			%AddWordButton.show()
			%WordMenu.close()
			CurrentWindow = 'WordListScreen'
		'Menu':
			%AddWord.hide()
			%Menu.show()
			%AddWordButton.hide()
			%WordMenu.close()
			CurrentWindow = 'Menu'
		'WordMenu':
			%AddWord.hide()
			%Menu.hide()
			%AddWordButton.hide()
			%WordMenu.open()
			CurrentWindow = 'WordMenu'


func _on_add_word_pressed():
	change_window('AddWord')
