extends Node
@onready var game = preload("res://Scenes/dialogues.tscn");

func _on_btn_exit_pressed() -> void:
	get_tree().quit()


func _on_btn_play_pressed() -> void:
	get_tree().change_scene_to_packed(game)


func _on_btn_settings_pressed() -> void:
	$OverlaySettings.visible = true
