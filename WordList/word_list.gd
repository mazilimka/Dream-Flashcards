extends VBoxContainer

@onready var word_scene : PackedScene = load('res://Words/Word/word.tscn')
@onready var test_word_scene := load('res://TestScenes/TestWord/test_word.tscn')

var saved_world = Global.load_from_file()


func _ready() -> void:
	Global.WordList = self
	
	Events.change_word.connect(change_word)
	Events.clear_all_words.connect(clear_all_words)
	Events.add_word.connect(add_word)
	
	if Global.is_start_app:
		for entry in saved_world:
			add_word(entry.word, entry.translation)
		Global.is_start_app = false


func add_word(word: String, translation: String):
	var word_instant = word_scene.instantiate()
	word_instant.set_word(word, translation)
	add_child(word_instant, true)
	Global.word_id += 1
	word_instant.my_id = Global.word_id


func clear_all_words():
	for word in get_children():
		word.queue_free()


func hide_transl_or_words(_toggled_on: bool, _what: String):
	match _what:
		'words':
			for i in get_children():
				i.hide_transl_or_words(_toggled_on, 'words')
		'transl':
			for i in get_children():
				i.hide_transl_or_words(_toggled_on, 'transl')


func change_word(word: String, translation: String, word_id: int):
	for _word in get_children():
		if _word.my_id == word_id:
			_word.change_word(word, translation)
