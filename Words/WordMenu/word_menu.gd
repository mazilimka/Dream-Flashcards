extends PanelContainer


func _ready() -> void:
	%Confirm.pressed.connect(_confirm_pressed)
	%Back.pressed.connect(_back_pressed)
	%WordName.text_submitted.connect(_word_name_text_changed)
	%WordTranslation.text_submitted.connect(_word_translation_text_changed)


func open():
	var word = Global.WordList.get_word_by_index(Global.curr_word_id)
	%WordName.placeholder_text = word['word']
	%WordTranslation.placeholder_text = word['translation']
	show()
	print(word)


func close():
	%WordName.clear()
	%WordTranslation.clear()
	hide()


func _back_pressed():
	WindowsManager.change_window('WordListScreen')


func _word_name_text_changed(new_text: String):
	Global.inp_word_name = new_text


func _word_translation_text_changed(new_text: String):
	Global.inp_word_transl = new_text


func _confirm_pressed():
	Events.change_word.emit(Global.inp_word_name, Global.inp_word_transl, Global.curr_word_id)
	_back_pressed()
