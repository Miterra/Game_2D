extends Node2D



func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")



func _on_easy_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_easy/game_easy.tscn")



func _on_standard_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_standard/game_standard.tscn")



func _on_hard_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_hard/game_hard.tscn")
