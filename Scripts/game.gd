extends Node2D

@onready var all: Button = $all

@onready var win_bar: ProgressBar = $WinBar





#Personnes (données communes)

var pers: int = 60
var persDispo: int = 60



#Batiments
var bars := []
var donneesCommunes := []
var persBats := []
var BtnBats := []

#bat_Principal
@onready var bat_principal: Button = $bat_Principal
@onready var bat_principal_windows: PanelContainer = $bat_PrincipalWindows
@onready var etat_bat_principal: ProgressBar = $bat_PrincipalWindows/VBoxContainer/etat_bat_Principal
@onready var Principal_donnees_communes: Label = $bat_PrincipalWindows/VBoxContainer/DonneesCommunes
@onready var Principal_chercheurs: Label = $bat_PrincipalWindows/VBoxContainer/Chercheurs
var persPrincipal: int = 0 #nombre de personne dans le bat



#bat_rech_pousse
@onready var bat_rech_pousse: Button = $bat_rech_pousse





#bat_rech_pousse2
@onready var bat_rech_pousse_2: Button = $bat_rech_pousse2




#antenne_market
@onready var antenne_market: Button = $Antenne_market




#bat_infirmerie
@onready var bat_infirmerie: Button = $bat_infirmerie





#bat_restauration
@onready var bat_restauration: Button = $bat_restauration





#bat_stockage
@onready var bat_stockage: Button = $bat_stockage







#bat_temp_market
@onready var bat_temps_market: Button = $bat_temps_market








func _on_revenir_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _ready() -> void:
	
	win_bar.min_value = 0
	win_bar.max_value = 100
	win_bar.value = 35
	
	bat_principal_windows.visible = false #on utilisera une boucle dans panels pour faire a chaque panel
	all.visible = false
	
	BtnBats = [bat_principal, bat_rech_pousse, bat_rech_pousse_2, antenne_market, bat_infirmerie, bat_restauration, bat_stockage, bat_temps_market]
	for btnbat in BtnBats :
		btnbat.modulate.a = 0



	
	bars = [etat_bat_principal]
	donneesCommunes = [Principal_donnees_communes]
	persBats = [persPrincipal]
	
	#bat_Principal
	Principal_donnees_communes.text = "Donnees Communes : \nPersonnes disponibles : " + str(persDispo) + "/" + str(pers)
	Principal_chercheurs.text = "Chercheurs : " + str(persPrincipal)






#functions

#Bat Principal--------------------------------------------------------------------------------------------------------
func _on_bat_principal_pressed() -> void:
	bat_principal_windows.visible = true
	all.visible = true


func _on_fermer_pressed() -> void:
	all.visible = false


func _on_ajouter_pressed() -> void:
	if persDispo > 0 :
		#Données Principal
		persDispo -= 1
		persPrincipal += 1
		Principal_chercheurs.text = "Chercheurs : " + str(persPrincipal)
		#Données Communes
		for donnees in donneesCommunes :
			donnees.text = "Donnees Communes : \nPersonnes disponibles : " + str(persDispo) + "/" + str(pers)



func _on_retirer_pressed() -> void:
	if persDispo < 60 and persPrincipal > 0 :
		persDispo += 1
		persPrincipal -= 1
		Principal_chercheurs.text = "Chercheurs : " + str(persPrincipal)
		for donnees in donneesCommunes :
			donnees.text = "Donnees Communes : \nPersonnes disponibles : " + str(persDispo) + "/" + str(pers)
#--------------------------------------------------------------------------------------------------------Bat Principal


func _on_passer_pressed() -> void:
	#bat principal-------------------
	if persPrincipal < 10 :
		etat_bat_principal.value -= 10
	if persPrincipal > 19 :
		etat_bat_principal.value += 20
	#-------------------bat principal
	
	
	# +- win condition : barre d'état
	for bar in bars :
		if bar.value < 50 :
			win_bar.value -= 1
		else :
			win_bar.value += 1
	
	if win_bar.value == 0 :
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
