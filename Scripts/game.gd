extends Node2D

@onready var all: Button = $all
@onready var win_bar: ProgressBar = $WinBar
@onready var mode: Label = $Mode

# Personnes globales
var pers: int = 50
var persDispo: int = 50

var tours: int = 1

var moisJour: int = 1
var moisNuit: int = 0

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
		"tour_cout": 5,
		"reparation_restante": 0
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
		"tour_cout": 5,
		"reparation_restante": 0
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
		"tour_cout": 5,
		"reparation_restante": 0
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
		"tour_cout": 5,
		"reparation_restante": 0
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
		"tour_cout": 5,
		"reparation_restante": 0
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
		"tour_cout": 5,
		"reparation_restante": 0
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
		"tour_cout": 5,
		"reparation_restante": 0
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
		"tour_cout": 5,
		"reparation_restante": 0
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
	print("Mode Jour : moisJour = " + str(moisJour))

	all.visible = false
	commande_windows.visible = false
	bat_detruit_windows.visible = false

	# Initialisation du dictionnaire
	setup_batiment("principal", Principal_nom, bat_principal, bat_principal_windows, etat_bat_principal, Principal_personnes, Principal_donnees_communes)
	setup_batiment("rech", Rech_nom, bat_rech_pousse, bat_rech_windows, etat_bat_rech, Rech_personnes, Rech_donnees_communes)
	setup_batiment("rech2", Rech2_nom, bat_rech2_pousse, bat_rech2_windows, etat_bat_rech2, Rech2_personnes, Rech2_donnees_communes)
	setup_batiment("antenne", Antenne_nom, antenne_market, bat_antenne_windows, etat_bat_antenne, Antenne_personnes, Antenne_donnees_communes)
	setup_batiment("infirmerie", Infirmerie_nom, bat_infirmerie, bat_infirmerie_windows, etat_bat_infirmerie, Infirmerie_personnes, Infirmerie_donnees_communes)
	setup_batiment("restauration", Restauration_nom, bat_restauration, bat_restauration_windows, etat_bat_restauration, Restauration_personnes, Restauration_donnees_communes)
	setup_batiment("stockage", Stockage_nom, bat_stockage, bat_stockage_windows, etat_bat_stockage, Stockage_personnes, Stockage_donnees_communes)
	setup_batiment("temps", Temps_nom, bat_temps_market, bat_temps_windows, etat_bat_temps, Temps_personnes, Temps_donnees_communes)

	
	
	for key in batiments.keys() :
		batiments[key].button.modulate = 0
		batiments[key].panel.visible = false

	# Mise à jour initiale
	_update_all_common_labels()

# --------------------------------------------------------------------
# INITIALISATION BATIMENT
# --------------------------------------------------------------------

func setup_batiment(key: String, nom_label: Label, button: Button, panel: PanelContainer, bar: ProgressBar, label_pers: Label, label_comm: Label):
	var b = batiments[key]
	nom_label.text = b.nom + "\netat du batiment :"
	b.button = button
	b.panel = panel
	b.bar = bar
	b.label_pers = label_pers
	b.label_common = label_comm
	b.pers = 0



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
	var b = batiments[key]
	var prix = b.cout

	if argent >= prix:
		argent -= prix
		argent_txt.text = "Argent : " + str(argent) + "€"


		b.etat = false
		b.reparation_restante = b.tour_cout

		print(b.nom + " en cours de réparation (" + str(b.reparation_restante) + " tours).")

		bouton.queue_free()

	else:
		print("Pas assez d'argent pour réparer", b.nom)






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
		batiments[key].label_pers.text = "Personnes : " + str(batiments[key].pers)


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




func _on_pdix_personnes_pressed() -> void:
	if current_bat == "":
		return

	var b = batiments[current_bat]

	# On ne peut pas ajouter plus que le nombre de personnes disponibles
	if persDispo <= 0:
		return

	# Combien peut-on réellement ajouter ?
	var ajout = min(10, persDispo)

	# Appliquer l’ajout
	persDispo -= ajout
	b.pers += ajout

	# Mettre à jour l'affichage
	b.label_pers.text = "Personnes : " + str(b.pers)
	_update_all_common_labels()





func _on_mdix_personnes_pressed() -> void:
	if current_bat == "":
		return

	var b = batiments[current_bat]

	# Combien peut-on réellement retirer ?
	var retrait = min(10, b.pers)

	# Appliquer le retrait
	b.pers -= retrait
	persDispo += retrait

	# Mise à jour affichage
	b.label_pers.text = "Personnes : " + str(b.pers)
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
	for c in delais_vbox.get_children():
		if c != $delais_commandeWindows/VBoxContainer/Temps_attente and c != $delais_commandeWindows/VBoxContainer/fermer_delais_commande :
			c.queue_free()

	for key in batiments.keys():
		var b = batiments[key]

		if b.etat == false: # seulement batiments détruits
			var label = Label.new()
			label.text = b.nom + " sera réparé dans " + str(b.reparation_restante) + " tours."
			delais_vbox.add_child(label)


#---------------------------------------------------------------------
# detruit fonctionnalités
#---------------------------------------------------------------------

func _on_fermer_detruit_pressed() -> void:
	bat_detruit_windows.visible = false
	all.visible = false


# --------------------------------------------------------------------
# PASSER / RÉSOLUTION
# --------------------------------------------------------------------

func _on_passer_pressed() -> void:
	var argent_genere: int = 0


	for key in batiments.keys():
		var b = batiments[key]

		if b.reparation_restante > 0:
			continue

		var pers = b.pers
		var bar = b.bar

		if pers < 10:
			bar.value -= 10
		elif pers > 19:
			bar.value += 20

		if bar.value <= 0 and b.etat == true:
			b.etat = false
			print(b.nom, " est détruit !")
			afficher_bouton_reparation(key)

		if b.etat == true:
			argent += 20000
			argent_genere += 20000
			print(b.nom + " génère 20 000€")

	print("Argent généré au total : " + str(argent_genere))
	argent_txt.text = "Argent : " + str(argent) + "€"
	print("Total argent :", argent)


	for key in batiments.keys():
		var b = batiments[key]

		if b.reparation_restante > 0:
			win_bar.value -= 1
			if win_bar.value <= 0:
				print("GAME OVER")
				get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
			continue

		if b.etat == false:
			win_bar.value -= 1
			if win_bar.value <= 0:
				print("GAME OVER")
				get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
			continue

		if b.bar.value < 50:
			win_bar.value -= 1
			if win_bar.value <= 0:
				print("GAME OVER")
				get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
		else:
			win_bar.value += 1


	tours += 1
	print("Tour :", tours)



	if moisNuit == 0 :
		moisJour += 1
		print("Mode Jour : moisJour = " + str(moisJour))
		if moisJour == 6 :
			pers = 10
			moisJour = 0
			print("30 personnes limité et moisJour = " + str(moisJour))
			for key in batiments.keys() :
				batiments[key].pers = 0
			persDispo = 10
			mode.text = "Mode Nuit"
			mode.add_theme_color_override("font_color", Color(0, 0, 0.5))
			_update_all_common_labels()



	if moisJour == 0 :
		moisNuit += 1
		print("Passage en mode Nuit. moisNuit = " + str(moisNuit))
		if moisNuit == 6 :
			pers = 50
			moisNuit = 0
			for key in batiments.keys() :
				batiments[key].pers = 0
			persDispo = 50
			_update_all_common_labels()
			mode.text = "Mode Jour"
			mode.add_theme_color_override("font_color", Color(1.0, 1.0, 0.0, 1.0))
			print("50 personnes limité et moisNuit = " + str(moisNuit))
			print("Passage en mode Jour")



	for key in batiments.keys():
		var b = batiments[key]

		if b.reparation_restante > 0:
			b.reparation_restante -= 1

			if b.reparation_restante == 0:
				b.etat = true
				b.bar.value = 50
				print(b.nom, " a été réparé !")


	if delais_commande_windows.visible:
		afficher_delais_reparations()


	if win_bar.value <= 0:
		print("GAME OVER")
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")







func _on_revenir_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
