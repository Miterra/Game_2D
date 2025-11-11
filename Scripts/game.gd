extends Node2D

@onready var bat_principal = $bat_PrincipalWindows

func _on_revenir_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _ready() -> void:
	bat_principal.visible = false


func _on_bat_principal_pressed() -> void:
	bat_principal.visible = true
