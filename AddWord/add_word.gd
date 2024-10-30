extends Panel


func _ready() -> void:
	%Confirm.pressed.connect(_confirm_pressed)
	%WordName.text_submitted.connect(_word_name_text_changed)
	%WordTranslate.text_submitted.connect(_word_translate_text_changed)
	%Cancel.pressed.connect(_cancel_pressed)


func _word_name_text_changed(new_text: String):
	Global.input_word_name = new_text


func _word_translate_text_changed(new_text: String):
	Global.input_word_translate = new_text


func _confirm_pressed():
	WindowsManager.change_window('WordList')
	Events.add_word.emit(Global.input_word_name, Global.input_word_translate)
	
	Global.save_to_file(Global.input_word_name, Global.input_word_translate)
	%WordName.clear()
	%WordTranslate.clear()


func _cancel_pressed():
	WindowsManager.change_window('WordList')
