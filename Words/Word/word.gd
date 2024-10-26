extends VBoxContainer


const RND_COLORS := [
	Color.RED,
	Color.ALICE_BLUE,
	Color.BLUE,
	Color.PINK,
	Color.CORAL,
	Color.CHOCOLATE,
	Color.CRIMSON,
	Color.DARK_SALMON,
	Color.AQUA,
	Color.CHARTREUSE
]


func _ready() -> void:
	%Name.label_settings.font_size = 70
	%Translation.label_settings.font_size = 70
	


func set_word(word: String, translation: String):
	%Name.text = word
	%Translation.text = translation
	%Translation.modulate = RND_COLORS.pick_random()
