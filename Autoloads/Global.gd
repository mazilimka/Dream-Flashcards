extends Node

const SAVE_FILE := "user://savegame.save"

var save_words := []
var is_start_app := false
var inp_word_name: String
var inp_word_transl: String

var word_id := 0
var curr_word_id: int

var WordList

func _ready() -> void:
	Events.change_word.connect(save_changed_word)
	is_start_app = true


func save_to_file(word: String, translation: String):
	if not FileAccess.file_exists(SAVE_FILE):
		var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
		if file == null:
			printerr('Error creating the file. Code {0}'.format([FileAccess.get_open_error()]))
			return
	
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ_WRITE)
	if file == null:
		printerr('Save failed with error code {0}'.format([FileAccess.get_open_error()]))
		return
	if file != null:
		file.seek(file.get_length())
		file.store_line(str(word) + ':' + str(translation))


func save_changed_word(word: String, translation: String, word_id: int):
	pass


func load_from_file() -> Array:
	if FileAccess.file_exists(SAVE_FILE):
		var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
		if file == null:
			printerr('Save failed with error code {0}'.format([FileAccess.get_open_error()]))
			return []
		if file != null:
			while not file.eof_reached():
				var line = file.get_line().strip_edges()
				var parts = line.split(':')
				if parts.size() == 2:
					save_words.append({'word': parts[0], 'translation': parts[1]})
	return save_words


func clear_all_words():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	if file == null:
		printerr('Save failed with error code {0}'.format([FileAccess.get_open_error()]))
		return
	else:
		file.store_line('')
		return
