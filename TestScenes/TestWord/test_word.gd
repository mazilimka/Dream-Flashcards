extends PanelContainer


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


func _ready() -> void:
	%Name.label_settings.font_size = 20
	%Translation.label_settings.font_size = 20


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
