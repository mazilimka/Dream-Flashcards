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


func _ready() -> void:
	%Name.label_settings.font_size = 75
	%Translation.label_settings.font_size = 75
	


func set_word(word: String, translation: String):
	%Name.text = word
	%Translation.text = translation
	%Name.modulate = RND_COLORS.pick_random()
	%Translation.modulate = RND_COLORS.pick_random()
