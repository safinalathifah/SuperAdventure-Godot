extends Control

@onready var cursor = $MushroomCursor
@onready var start_btn = $ButtonContainer/StartButton
@onready var setting_btn = $ButtonContainer/StartButton2
@onready var exit_btn = $ButtonContainer/StartButton3

func _ready() -> void:
	start_btn.mouse_entered.connect(_pindah_kursor.bind(start_btn))
	setting_btn.mouse_entered.connect(_pindah_kursor.bind(setting_btn))
	exit_btn.mouse_entered.connect(_pindah_kursor.bind(exit_btn))
	
	start_btn.pressed.connect(_on_start_pressed)
	setting_btn.pressed.connect(_on_setting_pressed)
	exit_btn.pressed.connect(_on_exit_pressed)

func _pindah_kursor(tombol: Control) -> void:
	cursor.global_position.y = tombol.global_position.y + (tombol.size.y - cursor.size.y) / 2.0

func _on_start_pressed() -> void:
	print("Tombol START GAME diklik!")

func _on_setting_pressed() -> void:
	get_tree().change_scene_to_file("res://setting.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
