extends Node2D

@onready var super_sonic = $Super_Sonic   # le AnimatedSprite2D
@onready var super_sonic2 = $Super_Sonic2   # le AnimatedSprite2D


func _ready():
	super_sonic2.visible = false
	super_sonic.visible = true

	# Lancer l'animation "idle"
	super_sonic.flip_h = false
	super_sonic.play("idle")
	
	# Après 2 secondes → passer à pouce bleu et activer flip H
	await get_tree().create_timer(0.25).timeout
	super_sonic.visible = false
	super_sonic2.visible = true

	super_sonic2.flip_h = true
	super_sonic2.play("pouce bleu")




func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_easy/game_easy.tscn")
