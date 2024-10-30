extends Panel


func _ready() -> void:
	%ClearWordList.pressed.connect(_clear_word_list_pressed)
	%Back.pressed.connect(_back_pressed)


func _clear_word_list_pressed():
	Events.clear_all_words.emit()
	Global.clear_all_words()
	_back_pressed()


func _back_pressed():
	WindowsManager.change_window('WordList')
