extends Node2D

@onready var all: Button = $all
@onready var win_bar: ProgressBar = $WinBar

# Personnes globales
var pers: int = 60
var persDispo: int = 60

# Bâtiment actuellement ouvert
var current_bat := ""

# Dictionnaire de bâtiments
var batiments = {
	"principal": {
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0
	},

	"rech": {
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0
	}#,
#
	#"rech2": {
		#"button": null,
		#"panel": null,
		#"bar": null,
		#"label_pers": null,
		#"label_common": null,
		#"pers": 0
	#},
#
	#"antenne": {
		#"button": null,
		#"panel": null,
		#"bar": null,
		#"label_pers": null,
		#"label_common": null,
		#"pers": 0
	#},
#
	#"infirmerie": {
		#"button": null,
		#"panel": null,
		#"bar": null,
		#"label_pers": null,
		#"label_common": null,
		#"pers": 0
	#},
#
	#"restauration": {
		#"button": null,
		#"panel": null,
		#"bar": null,
		#"label_pers": null,
		#"label_common": null,
		#"pers": 0
	#},
#
	#"stockage": {
		#"button": null,
		#"panel": null,
		#"bar": null,
		#"label_pers": null,
		#"label_common": null,
		#"pers": 0
	#},
#
	#"market": {
		#"button": null,
		#"panel": null,
		#"bar": null,
		#"label_pers": null,
		#"label_common": null,
		#"pers": 0
	#}

}

# --------------------------------------------------------------------
# RÉFÉRENCES NODES
# --------------------------------------------------------------------

# bat_Principal
@onready var bat_principal: Button = $bat_Principal
@onready var bat_principal_windows: PanelContainer = $bat_PrincipalWindows
@onready var etat_bat_principal: ProgressBar = $bat_PrincipalWindows/VBoxContainer/etat_bat_Principal
@onready var Principal_donnees_communes: Label = $bat_PrincipalWindows/VBoxContainer/DonneesCommunes
@onready var Principal_personnes: Label = $bat_PrincipalWindows/VBoxContainer/Personnes

# bat_rech
@onready var bat_rech_pousse: Button = $bat_rech_pousse
@onready var bat_rech_windows: PanelContainer = $bat_rechWindows
@onready var etat_bat_rech: ProgressBar = $bat_rechWindows/VBoxContainer/etat_bat_Rech
@onready var Rech_donnees_communes: Label = $bat_rechWindows/VBoxContainer/DonneesCommunes
@onready var Rech_personnes: Label = $bat_rechWindows/VBoxContainer/Personnes




# bat_rech2
@onready var bat_rech_pousse_2: Button = $bat_rech_pousse2




# Antenne
@onready var antenne_market: Button = $Antenne_market




# bat_infirmerie
@onready var bat_infirmerie: Button = $bat_infirmerie




# bat_restauration
@onready var bat_restauration: Button = $bat_restauration




# bat_stockage
@onready var bat_stockage: Button = $bat_stockage




# bat_temps
@onready var bat_temps_market: Button = $bat_temps_market







# --------------------------------------------------------------------
# READY()
# --------------------------------------------------------------------
func _ready() -> void:

	win_bar.min_value = 0
	win_bar.max_value = 100
	win_bar.value = 35

	all.visible = false
	bat_principal_windows.visible = false

	# Initialisation du dictionnaire
	batiments["principal"].button = bat_principal
	batiments["principal"].panel = bat_principal_windows
	batiments["principal"].bar = etat_bat_principal
	batiments["principal"].label_pers = Principal_personnes
	batiments["principal"].label_common = Principal_donnees_communes
	batiments["principal"].pers = 0
	
	batiments["rech"].button = bat_rech_pousse
	batiments["rech"].panel = bat_rech_windows
	batiments["rech"].bar = etat_bat_rech
	batiments["rech"].label_pers = Rech_personnes
	batiments["rech"].label_common = Rech_donnees_communes
	batiments["rech"].pers = 0
	
	for key in batiments.keys() :
		batiments[key].button.modulate = 0

	# Mise à jour initiale
	_update_all_common_labels()



# --------------------------------------------------------------------
# FONCTIONS COMMUNES
# --------------------------------------------------------------------

func open_batiment(name: String) -> void:
	current_bat = name

	# Affiche le panel du bâtiment
	for key in batiments.keys():
		batiments[key].panel.visible = (key == name)

	all.visible = true


func _update_all_common_labels() -> void:
	for key in batiments.keys():
		batiments[key].label_common.text = "Personnes disponibles : " + str(persDispo) + "/" + str(pers)


func ajouter_personne() -> void:
	if current_bat == "":
		return

	if persDispo > 0:
		persDispo -= 1
		batiments[current_bat].pers += 1

		batiments[current_bat].label_pers.text = "Personnes : " + str(batiments[current_bat].pers)
		_update_all_common_labels()


func retirer_personne() -> void:
	if current_bat == "":
		return

	if batiments[current_bat].pers > 0:
		persDispo += 1
		batiments[current_bat].pers -= 1

		batiments[current_bat].label_pers.text = "Personnes : " + str(batiments[current_bat].pers)
		_update_all_common_labels()



# --------------------------------------------------------------------
# SIGNALS (boutons)
# --------------------------------------------------------------------

func _on_bat_principal_pressed() -> void:
	open_batiment("principal")

func _on_bat_rech_pousse_pressed() -> void:
	open_batiment("rech")



func _on_ajouter_pressed() -> void:
	ajouter_personne()


func _on_retirer_pressed() -> void:
	retirer_personne()


func _on_fermer_pressed() -> void:
	all.visible = false
	for key in batiments.keys():
		batiments[key].panel.visible = false
	current_bat = ""



# --------------------------------------------------------------------
# PASSER / RÉSOLUTION
# --------------------------------------------------------------------

func _on_passer_pressed() -> void:
	
	for key in batiments.keys():
		var b = batiments[key]
		var pers = b.pers
		var bar = b.bar

		# Logique de perte/gain
		if pers < 10:
			bar.value -= 10
		
		if pers > 19:
			bar.value += 20
	#------------------------------------------------------------------

	# Mise à jour de la winbar
	for key in batiments.keys():
		var bar = batiments[key].bar
		
		if bar.value < 50:
			win_bar.value -= 1
		else:
			win_bar.value += 1

	if win_bar.value <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")



func _on_revenir_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
