extends VBoxContainer

@onready var word_scene : PackedScene = load('res://Words/Word/word.tscn')

var saved_world = Global.load_from_file()


func _ready() -> void:
	if Global.is_start_app:
		for entry in saved_world:
			add_word(entry.word, entry.translation)
		Global.is_start_app = false
	
	Events.add_word.connect(add_word)


func add_word(word: String, translation: String):
	var word_instant : HBoxContainer = word_scene.instantiate()
	word_instant.set_word(word, translation)
	add_child(word_instant, true)
