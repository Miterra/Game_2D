extends Node2D




func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/select_difficulty.tscn")




func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options.tscn")




func _on_quit_pressed() -> void:
	get_tree().quit()




func _on_instagram_pressed() -> void:
	OS.shell_open("https://instagram.com/halxl_")  # remplace par ton @


func _on_test_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/dialogues.tscn")
