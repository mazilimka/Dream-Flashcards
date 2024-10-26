extends Control

@onready var word_list: VBoxContainer = %WordList



func _init() -> void:
	OS.request_permission('write_user_dictionary')
	OS.request_permission('read_user_dictionary')
	OS.request_permissions()


func _ready() -> void:
	%AddWord.pressed.connect(_on_add_word_pressed)


func _on_add_word_pressed():
	WindowsManager.change_window('AddWord')
