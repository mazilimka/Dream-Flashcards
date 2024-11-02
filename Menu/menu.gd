extends PanelContainer


func _ready() -> void:
	%ClearWordList.pressed.connect(_clear_word_list_pressed)
	%Back.pressed.connect(_back_pressed)
	%HideWords.toggled.connect(_hide_words_toggled)
	%HideTranslations.toggled.connect(_hide_translations_toggled)


func _clear_word_list_pressed():
	Events.clear_all_words.emit()
	Global.clear_all_words()
	_back_pressed()


func _back_pressed():
	WindowsManager.change_window('WordListScreen')


func _hide_words_toggled(toggled_on: bool):
	Global.WordList.hide_transl_or_words(toggled_on, 'words')

func _hide_translations_toggled(toggled_on: bool):
	Global.WordList.hide_transl_or_words(toggled_on, 'transl')
