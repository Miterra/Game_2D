extends Node2D

@onready var all: Button = $all
@onready var win_bar: ProgressBar = $WinBar

# Personnes globales
var pers: int = 50
var persDispo: int = 50

var tours: int = 1

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
		"pers": 0,
		"etat": true,
		"cout": 300000,
		"tour_cout": 3
	},

	"rech": {
		"nom": "Batiment recherche",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0,
		"etat": true,
		"cout": 100000,
		"tour_cout": 3
	},

	"rech2": {
		"nom": "Batiment recherche 2",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0,
		"etat": true,
		"cout": 100000,
		"tour_cout": 3
	},

	"antenne": {
		"nom": "Batiment antenne",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0,
		"etat": true,
		"cout": 500000,
		"tour_cout": 3
	},

	"infirmerie": {
		"nom": "Batiment infirmerie",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0,
		"etat": true,
		"cout": 100000,
		"tour_cout": 3
	},

	"restauration": {
		"nom": "Batiment restaurant",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0,
		"etat": true,
		"cout": 100000,
		"tour_cout": 3
	},

	"stockage": {
		"nom": "Batiment stockage",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0,
		"etat": true,
		"cout": 100000,
		"tour_cout": 3
	},

	"temps": {
		"nom": "Batiment temps marketing",
		"button": null,
		"panel": null,
		"bar": null,
		"label_pers": null,
		"label_common": null,
		"pers": 0,
		"etat": true,
		"cout": 250000,
		"tour_cout": 3
	}

}

# --------------------------------------------------------------------
# Argent
# --------------------------------------------------------------------
var argent: int = 250000
@onready var argent_txt: Label = $Argent




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

#---------------------------------------------------------------------
# commander windows
#---------------------------------------------------------------------
@onready var commande_windows: PanelContainer = $CommandeWindows
@onready var commande_vbox: VBoxContainer = $CommandeWindows/VBoxContainer



#---------------------------------------------------------------------
# detruit windows
#---------------------------------------------------------------------
@onready var bat_detruit_windows: PanelContainer = $bat_detruitWindows
@onready var nom_detruit: Label = $bat_detruitWindows/VBoxContainer/nom_detruit


#---------------------------------------------------------------------
# Temps fonctionnalités
#---------------------------------------------------------------------
@onready var delais_commande_windows: PanelContainer = $delais_commandeWindows
@onready var delais_vbox: VBoxContainer = $delais_commandeWindows/VBoxContainer



# --------------------------------------------------------------------
# READY()
# --------------------------------------------------------------------
func _ready() -> void:

	win_bar.min_value = 0
	win_bar.max_value = 100
	win_bar.value = 35

	argent_txt.text = "Argent : " + str(argent) + "€"
	tours = 1
	print("Tour : " + str(tours))

	all.visible = false
	commande_windows.visible = false
	bat_detruit_windows.visible = false

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
# FONCTIONS COMMANDE
# --------------------------------------------------------------------


func afficher_bouton_reparation(key:String):
	var prix = batiments[key].cout

	var bouton = Button.new()
	bouton.text = "Reparer " + batiments[key].nom + " - " + str(prix) + "€"
	bouton.name = "reparer_" + key

	bouton.connect("pressed", Callable(self, "_reparer_batiment").bind(key, bouton)) # à voir ce que ca fait exactement

	commande_vbox.add_child(bouton)



func _reparer_batiment(key:String, bouton:Button):
	var prix = batiments[key].cout

	if argent >= prix:
		argent -= prix
		argent_txt.text = "Argent : " + str(argent) + "€"

		print(batiments[key].nom + " réparé !")
		batiments[key].etat = true
		batiments[key].bar.value = 50   # tu peux ajuster

		bouton.queue_free()  # retiré de la liste de commandes

		# Si plus aucun bouton → fermeture du panel
		if commande_vbox.get_child_count() == 0:
			commande_windows.visible = false

		bat_detruit_windows.visible = false

	else:
		print("Pas assez d'argent pour réparer", batiments[key].nom)





# --------------------------------------------------------------------
# FONCTIONS COMMUNES
# --------------------------------------------------------------------

func open_batiment(name: String) -> void:
	current_bat = name

	# Affiche le panel du bâtiment
	for key in batiments.keys():
		batiments[key].panel.visible = (key == name)

	all.visible = true

func open_destruct_batiment(name: String) -> void:
	nom_detruit.text = "Batiment " + name

	bat_detruit_windows.visible = true

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
	if batiments["principal"].etat != false :
		open_batiment("principal")
	else :
		open_destruct_batiment("principal")

func _on_bat_rech_pousse_pressed() -> void:
	if batiments["rech"].etat != false :
		open_batiment("rech")
	else :
		open_destruct_batiment("rech")

func _on_bat_rech_pousse_2_pressed() -> void:
	if batiments["rech2"].etat != false :
		open_batiment("rech2")
	else :
		open_destruct_batiment("rech2")

func _on_antenne_market_pressed() -> void:
	if batiments["antenne"].etat != false :
		open_batiment("antenne")
	else :
		open_destruct_batiment("antenne")

func _on_bat_infirmerie_pressed() -> void:
	if batiments["infirmerie"].etat != false :
		open_batiment("infirmerie")
	else :
		open_destruct_batiment("infirmerie")

func _on_bat_restauration_pressed() -> void:
	if batiments["restauration"].etat != false :
		open_batiment("restauration")
	else :
		open_destruct_batiment("restauration")

func _on_bat_stockage_pressed() -> void:
	if batiments["stockage"].etat != false :
		open_batiment("stockage")
	else :
		open_destruct_batiment("stockage")

func _on_bat_temps_market_pressed() -> void:
	if batiments["temps"].etat != false :
		open_batiment("temps")
	else :
		open_destruct_batiment("temps")

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

#---------------------------------------------------------------------
# Antenne fonctionnalités
#---------------------------------------------------------------------

func _on_commander_pressed() -> void:
	commande_windows.visible = true

func _on_fermer_commande_pressed() -> void:
	commande_windows.visible = false

#---------------------------------------------------------------------
# Temps fonctionnalités
#---------------------------------------------------------------------

func _on_delais_commande_pressed() -> void:
	afficher_delais_reparations()
	delais_commande_windows.visible = true

func _on_fermer_delais_commande_pressed() -> void:
	delais_commande_windows.visible = false



func afficher_delais_reparations():
	delais_vbox.queue_free_children() # nettoie l'ancienne liste (important)

	for key in batiments.keys():
		var b = batiments[key]

		if b.etat == false: # seulement batiments détruits
			var label = Label.new()
			label.text = b.nom + " sera réparé dans " + str(b.tour_cout) + " tours."
			delais_vbox.add_child(label)


#---------------------------------------------------------------------
# detruit fonctionnalités
#---------------------------------------------------------------------

func _on_fermer_detruit_pressed() -> void:
	bat_detruit_windows.visible = false


# --------------------------------------------------------------------
# PASSER / RÉSOLUTION
# --------------------------------------------------------------------

func _on_passer_pressed() -> void:

	for key in batiments.keys():
		var b = batiments[key]
		var pers = b.pers
		var bar = b.bar

		if pers < 10:
			bar.value -= 10
		elif pers > 19:
			bar.value += 20

		if bar.value <= 0 and b.etat == true:
			b.etat = false
			print(b.nom, "est détruit !")
			afficher_bouton_reparation(key)

		if b.etat == true:
			argent += 20000
			print(b.nom + " génère 20 000€")


	argent_txt.text = "Argent : " + str(argent) + "€"
	print("Total argent :", argent)


	for key in batiments.keys():
		if batiments[key].bar.value < 50:
			win_bar.value -= 1
		else:
			win_bar.value += 1


	tours += 1
	print("Tour :", tours)


	for key in batiments.keys():
		var b = batiments[key]

		if b.etat == false and b.tour_cout > 0:
			b.tour_cout -= 1

			if b.tour_cout == 0:
				b.etat = true
				b.bar.value = 50
				print(b.nom, "a été réparé automatiquement !")

	if delais_commande_windows.visible:
		afficher_delais_reparations()


	if win_bar.value <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")





func _on_revenir_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
