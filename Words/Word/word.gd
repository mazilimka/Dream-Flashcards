extends MarginContainer


const RND_COLORS := [
	Color.RED,
	Color.PINK,
	Color.CORAL,
	Color.CHOCOLATE,
	Color.CRIMSON,
	Color.DARK_SALMON,
	Color.AQUA,
	Color.CHARTREUSE,
	Color.DARK_SALMON,
	Color.GOLD,
	Color.YELLOW_GREEN,
	Color.YELLOW,
	Color.TOMATO
]

var my_id: int

func _ready() -> void:
	Events.change_word.connect(change_word)
	%WordButton.pressed.connect(_word_button_pressed)
	
	%Name.label_settings.font_size = 75
	%Translation.label_settings.font_size = 75


func set_word(word: String, translation: String):
	%Name.text = word
	%Translation.text = translation
	%Name.modulate = RND_COLORS.pick_random()
	%Translation.modulate = RND_COLORS.pick_random()


func hide_transl_or_words(_toggled_on: bool, _what: String):
	if _toggled_on:
		match _what:
			'words':
				%Name.hide()
			'transl':
				%Translation.hide()
	else:
		match _what:
			'words':
				%Name.show()
			'transl':
				%Translation.show()


func _word_button_pressed():
	WindowsManager.change_window('WordMenu')
	Global.curr_word_id = my_id


func change_word(word: String, translation: String):
	%Name.text = word
	%Translation.text = translation
