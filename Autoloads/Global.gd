extends Node

const SAVE_FILE := "user://savegame.save"
const SAVE_WORDS := []

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
	var words := []
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
					words.append({'word': parts[0], 'translation': parts[1]})
	return words


#func save_data():
	#var save_game_file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	#if save_game_file == null:
		#printerr('Save failed with error code {0}'.format([FileAccess.get_open_error()]))
		#return
	#var game_data := {}
	#for variable in SAVE_WORDS:
		#game_data[variable] = get(variable)
	#var json_object := JSON.new()
	#save_game_file.store_line(json_object.stringify(game_data))
#
#
#func load_data():
	#pass
