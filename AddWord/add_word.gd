extends PanelContainer


func _ready() -> void:
	%Confirm.pressed.connect(_confirm_pressed)
	%WordName.text_submitted.connect(_word_name_text_changed)
	%WordTranslation.text_submitted.connect(_word_translate_text_changed)
	%Cancel.pressed.connect(_cancel_pressed)


func _word_name_text_changed(new_text: String):
	Global.inp_word_name = new_text


func _word_translate_text_changed(new_text: String):
	Global.inp_word_transl = new_text


func _confirm_pressed():
	%AnimationPlayer.play("add_word")
	Events.add_word.emit(Global.inp_word_name, Global.inp_word_transl)
	Global.save_to_file(Global.inp_word_name, Global.inp_word_transl)
	
	await %AnimationPlayer.animation_finished
	WindowsManager.change_window('WordListScreen')
	if %WordName.text != '':
		%WordName.clear()
	if %WordTranslation.text != '':
		%WordTranslation.clear()
	modulate = Color('ffffff')


func _cancel_pressed():
	WindowsManager.change_window('WordListScreen')
