extends VBoxContainer

@onready var word_scene : PackedScene = load('res://Words/Word/word.tscn')

var saved_world = Global.load_from_file()


func _ready() -> void:
	Events.clear_all_words.connect(clear_all_words)
	Events.add_word.connect(add_word)
	
	if Global.is_start_app:
		for entry in saved_world:
			add_word(entry.word, entry.translation)
		Global.is_start_app = false
	


func add_word(word: String, translation: String):
	var word_instant : MarginContainer = word_scene.instantiate()
	word_instant.set_word(word, translation)
	add_child(word_instant, true)


func clear_all_words():
	for word in get_children():
		word.queue_free()
