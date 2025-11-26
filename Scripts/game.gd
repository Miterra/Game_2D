extends Node2D

@onready var bat_principal = $bat_PrincipalWindows
@onready var all = $all

@onready var win_bar: ProgressBar = $WinBar





#Personnes

var pers: int = 100
var persDispo: int = 100

#Batiments
var bars := []
#bat_Principal
@onready var etat_bat_principal: ProgressBar = $bat_PrincipalWindows/VBoxContainer/etat_bat_Principal
@onready var donnees_communes: Label = $bat_PrincipalWindows/VBoxContainer/DonneesCommunes
@onready var chercheurs: Label = $bat_PrincipalWindows/VBoxContainer/Chercheurs
var persPrincipal: int = 0


func _on_revenir_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _ready() -> void:
	donnees_communes.text = "Donnees Communes : \n Personnes disponibles : " + str(persDispo) + "/" + str(pers)
	chercheurs.text = "Chercheurs : " + str(persPrincipal)
	
	win_bar.min_value = 0
	win_bar.max_value = 100
	win_bar.value = 35
	bat_principal.visible = false
	all.visible = false
	


func _on_bat_principal_pressed() -> void:
	bat_principal.visible = true
	all.visible = true


func _on_fermer_pressed() -> void:
	all.visible = false


func _on_passer_pressed() -> void:
	etat_bat_principal.value -= 10


func _on_ajouter_pressed() -> void:
	if persDispo > 0 :
		persDispo -= 1
		persPrincipal += 1
		donnees_communes.text = "Donnees Communes : \n Personnes disponibles : " + str(persDispo) + "/" + str(pers)
		chercheurs.text = "Chercheurs : " + str(persPrincipal)



func _on_retirer_pressed() -> void:
	if persDispo < 100 and persPrincipal > 0 :
		persDispo += 1
		persPrincipal -= 1
		donnees_communes.text = "Donnees Communes : \n Personnes disponibles : " + str(persDispo) + "/" + str(pers)
		chercheurs.text = "Chercheurs : " + str(persPrincipal)
