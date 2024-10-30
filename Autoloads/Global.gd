extends Node

const SAVE_FILE := "user://savegame.save"

var save_words := []
var is_start_app := false
var word_counter := 0
var input_word_name: String
var input_word_translate: String


func _ready() -> void:
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
