extends CanvasLayer

@onready var exit_btn = $ExitLevelButton

func _ready() -> void:
	exit_btn.pressed.connect(_on_exit_pressed)

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
