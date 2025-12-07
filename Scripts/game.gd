extends Node2D

@onready var all: Button = $all
@onready var win_bar: ProgressBar = $WinBar

# Personnes globales
var pers: int = 70
var persDispo: int = 70

# Bâtiment actuellement ouvert
var current_bat := ""

# Dictionnaire de bâtiments
var batiments = {
	"principal": {
		"nom": "Batiment principal",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0
	},

	"rech": {
		"nom": "Batiment recherche",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0
	},

	"rech2": {
		"nom": "Batiment recherche 2",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0
	},

	"antenne": {
		"nom": "Batiment antenne",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0
	},

	"infirmerie": {
		"nom": "Batiment infirmerie",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0
	},

	"restauration": {
		"nom": "Batiment restaurant",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0
	},

	"stockage": {
		"nom": "Batiment stockage",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0
	},

	"temps": {
		"nom": "Batiment temps marketing",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0
	}

}

# --------------------------------------------------------------------
# RÉFÉRENCES NODES
# --------------------------------------------------------------------

# bat_Principal
@onready var Principal_nom: Label = $bat_PrincipalWindows/VBoxContainer/Nom
@onready var bat_principal: Button = $bat_Principal
@onready var bat_principal_windows: PanelContainer = $bat_PrincipalWindows
@onready var etat_bat_principal: ProgressBar = $bat_PrincipalWindows/VBoxContainer/etat_bat_Principal
@onready var Principal_donnees_communes: Label = $bat_PrincipalWindows/VBoxContainer/DonneesCommunes
@onready var Principal_personnes: Label = $bat_PrincipalWindows/VBoxContainer/Personnes




# bat_rech
@onready var Rech_nom: Label = $bat_rechWindows/VBoxContainer/Nom
@onready var bat_rech_pousse: Button = $bat_rech_pousse
@onready var bat_rech_windows: PanelContainer = $bat_rechWindows
@onready var etat_bat_rech: ProgressBar = $bat_rechWindows/VBoxContainer/etat_bat_Rech
@onready var Rech_donnees_communes: Label = $bat_rechWindows/VBoxContainer/DonneesCommunes
@onready var Rech_personnes: Label = $bat_rechWindows/VBoxContainer/Personnes




# bat_rech2
@onready var Rech2_nom: Label = $bat_rech2Windows/VBoxContainer/Nom
@onready var bat_rech2_pousse: Button = $bat_rech_pousse2
@onready var bat_rech2_windows: PanelContainer = $bat_rech2Windows
@onready var etat_bat_rech2: ProgressBar = $bat_rech2Windows/VBoxContainer/etat_bat_Rech2
@onready var Rech2_donnees_communes: Label = $bat_rech2Windows/VBoxContainer/DonneesCommunes
@onready var Rech2_personnes: Label = $bat_rech2Windows/VBoxContainer/Personnes




# Antenne
@onready var Antenne_nom: Label = $bat_antenneWindows/VBoxContainer/Nom
@onready var antenne_market: Button = $Antenne_market
@onready var bat_antenne_windows: PanelContainer = $bat_antenneWindows
@onready var etat_bat_antenne: ProgressBar = $bat_antenneWindows/VBoxContainer/etat_bat_Antenne
@onready var Antenne_donnees_communes: Label = $bat_antenneWindows/VBoxContainer/DonneesCommunes
@onready var Antenne_personnes: Label = $bat_antenneWindows/VBoxContainer/Personnes




# bat_infirmerie
@onready var Infirmerie_nom: Label = $bat_infirmerieWindows/VBoxContainer/Nom
@onready var bat_infirmerie: Button = $bat_infirmerie
@onready var bat_infirmerie_windows: PanelContainer = $bat_infirmerieWindows
@onready var etat_bat_infirmerie: ProgressBar = $bat_infirmerieWindows/VBoxContainer/etat_bat_Infirmerie
@onready var Infirmerie_donnees_communes: Label = $bat_infirmerieWindows/VBoxContainer/DonneesCommunes
@onready var Infirmerie_personnes: Label = $bat_infirmerieWindows/VBoxContainer/Personnes




# bat_restauration
@onready var Restauration_nom: Label = $bat_restaurationWindows/VBoxContainer/Nom
@onready var bat_restauration: Button = $bat_restauration
@onready var bat_restauration_windows: PanelContainer = $bat_restaurationWindows
@onready var etat_bat_restauration: ProgressBar = $bat_restaurationWindows/VBoxContainer/etat_bat_Restauration
@onready var Restauration_donnees_communes: Label = $bat_restaurationWindows/VBoxContainer/DonneesCommunes
@onready var Restauration_personnes: Label = $bat_restaurationWindows/VBoxContainer/Personnes




# bat_stockage
@onready var Stockage_nom: Label = $bat_stockageWindows/VBoxContainer/Nom
@onready var bat_stockage: Button = $bat_stockage
@onready var bat_stockage_windows: PanelContainer = $bat_stockageWindows
@onready var etat_bat_stockage: ProgressBar = $bat_stockageWindows/VBoxContainer/etat_bat_Stockage
@onready var Stockage_donnees_communes: Label = $bat_stockageWindows/VBoxContainer/DonneesCommunes
@onready var Stockage_personnes: Label = $bat_stockageWindows/VBoxContainer/Personnes




# bat_temps
@onready var Temps_nom: Label = $bat_tempsWindows/VBoxContainer/Nom
@onready var bat_temps_market: Button = $bat_temps_market
@onready var bat_temps_windows: PanelContainer = $bat_tempsWindows
@onready var etat_bat_temps: ProgressBar = $bat_tempsWindows/VBoxContainer/etat_bat_Temps
@onready var Temps_donnees_communes: Label = $bat_tempsWindows/VBoxContainer/DonneesCommunes
@onready var Temps_personnes: Label = $bat_tempsWindows/VBoxContainer/Personnes




# --------------------------------------------------------------------
# READY()
# --------------------------------------------------------------------
func _ready() -> void:

	win_bar.min_value = 0
	win_bar.max_value = 100
	win_bar.value = 35

	all.visible = false

	# Initialisation du dictionnaire
	Principal_nom.text = batiments["principal"].nom + "\netat du batiment :"
	batiments["principal"].button = bat_principal
	batiments["principal"].panel = bat_principal_windows
	batiments["principal"].bar = etat_bat_principal
	batiments["principal"].label_pers = Principal_personnes
	batiments["principal"].label_common = Principal_donnees_communes
	batiments["principal"].pers = 0
	
	Rech_nom.text = batiments["rech"].nom + "\netat du batiment :"
	batiments["rech"].button = bat_rech_pousse
	batiments["rech"].panel = bat_rech_windows
	batiments["rech"].bar = etat_bat_rech
	batiments["rech"].label_pers = Rech_personnes
	batiments["rech"].label_common = Rech_donnees_communes
	batiments["rech"].pers = 0
	
	Rech2_nom.text = batiments["rech2"].nom + "\netat du batiment :"
	batiments["rech2"].button = bat_rech2_pousse
	batiments["rech2"].panel = bat_rech2_windows
	batiments["rech2"].bar = etat_bat_rech2
	batiments["rech2"].label_pers = Rech2_personnes
	batiments["rech2"].label_common = Rech2_donnees_communes
	batiments["rech2"].pers = 0
	
	Antenne_nom.text = batiments["antenne"].nom + "\netat du batiment :"
	batiments["antenne"].button = antenne_market
	batiments["antenne"].panel = bat_antenne_windows
	batiments["antenne"].bar = etat_bat_antenne
	batiments["antenne"].label_pers = Antenne_personnes
	batiments["antenne"].label_common = Antenne_donnees_communes
	batiments["antenne"].pers = 0
	
	Infirmerie_nom.text = batiments["infirmerie"].nom + "\netat du batiment :"
	batiments["infirmerie"].button = bat_infirmerie
	batiments["infirmerie"].panel = bat_infirmerie_windows
	batiments["infirmerie"].bar = etat_bat_infirmerie
	batiments["infirmerie"].label_pers = Infirmerie_personnes
	batiments["infirmerie"].label_common = Infirmerie_donnees_communes
	batiments["infirmerie"].pers = 0
	
	Restauration_nom.text = batiments["restauration"].nom + "\netat du batiment :"
	batiments["restauration"].button = bat_restauration
	batiments["restauration"].panel = bat_restauration_windows
	batiments["restauration"].bar = etat_bat_restauration
	batiments["restauration"].label_pers = Restauration_personnes
	batiments["restauration"].label_common = Restauration_donnees_communes
	batiments["restauration"].pers = 0
	
	Stockage_nom.text = batiments["stockage"].nom + "\netat du batiment :"
	batiments["stockage"].button = bat_stockage
	batiments["stockage"].panel = bat_stockage_windows
	batiments["stockage"].bar = etat_bat_stockage
	batiments["stockage"].label_pers = Stockage_personnes
	batiments["stockage"].label_common = Stockage_donnees_communes
	batiments["stockage"].pers = 0
	
	Temps_nom.text = batiments["temps"].nom + "\netat du batiment :"
	batiments["temps"].button = bat_temps_market
	batiments["temps"].panel = bat_temps_windows
	batiments["temps"].bar = etat_bat_temps
	batiments["temps"].label_pers = Temps_personnes
	batiments["temps"].label_common = Temps_donnees_communes
	batiments["temps"].pers = 0
	
	
	for key in batiments.keys() :
		batiments[key].button.modulate = 0
		batiments[key].panel.visible = false

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

func _on_bat_rech_pousse_2_pressed() -> void:
	open_batiment("rech2")

func _on_antenne_market_pressed() -> void:
	open_batiment("antenne")

func _on_bat_infirmerie_pressed() -> void:
	open_batiment("infirmerie")

func _on_bat_restauration_pressed() -> void:
	open_batiment("restauration")

func _on_bat_stockage_pressed() -> void:
	open_batiment("stockage")

func _on_bat_temps_market_pressed() -> void:
	open_batiment("temps")

#----------------------------------------------------------------------

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
