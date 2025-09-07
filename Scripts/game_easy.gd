extends Node2D



func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/select_difficulty.tscn")


func _on_baker_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_easy/baker.tscn")
