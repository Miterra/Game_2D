extends Node2D

# --------------------------------------------------------------------
# 1. RÉFÉRENCES UI (VUE)
# --------------------------------------------------------------------
@onready var all: Button = $all
@onready var win_bar: ProgressBar = $WinBar
@onready var mode: Label = $Mode
@onready var argent_txt: Label = $Argent

# Fenêtres des bâtiments
@onready var bat_principal_windows: PanelContainer = $bat_PrincipalWindows
@onready var bat_rech_windows: PanelContainer = $bat_rechWindows
@onready var bat_rech2_windows: PanelContainer = $bat_rech2Windows
@onready var bat_antenne_windows: PanelContainer = $bat_antenneWindows
@onready var bat_infirmerie_windows: PanelContainer = $bat_infirmerieWindows
@onready var bat_restauration_windows: PanelContainer = $bat_restaurationWindows
@onready var bat_stockage_windows: PanelContainer = $bat_stockageWindows
@onready var bat_temps_windows: PanelContainer = $bat_tempsWindows

# Fenêtres spéciales
@onready var commande_windows: PanelContainer = $CommandeWindows
@onready var commande_vbox: VBoxContainer = $CommandeWindows/VBoxContainer
@onready var bat_detruit_windows: PanelContainer = $bat_detruitWindows
@onready var nom_detruit: Label = $bat_detruitWindows/VBoxContainer/nom_detruit
@onready var delais_commande_windows: PanelContainer = $delais_commandeWindows
@onready var delais_vbox: VBoxContainer = $delais_commandeWindows/VBoxContainer

# Labels spécifiques (pour l'initialisation)
@onready var Principal_nom: Label = $bat_PrincipalWindows/VBoxContainer/Nom
@onready var Principal_personnes: Label = $bat_PrincipalWindows/VBoxContainer/Personnes
@onready var Principal_donnees_communes: Label = $bat_PrincipalWindows/VBoxContainer/DonneesCommunes
@onready var etat_bat_principal: ProgressBar = $bat_PrincipalWindows/VBoxContainer/etat_bat_Principal
@onready var bat_principal_btn: Button = $bat_Principal

# (Ajoute ici les autres @onready spécifiques si besoin, j'ai simplifié pour l'exemple
# mais le code setup_batiment utilise tes nœuds existants dans la scène)
# Assure-toi que tes nœuds dans la scène (Game.tscn) ont bien ces noms exacts.

# --------------------------------------------------------------------
# 2. DONNÉES DU JEU (MODÈLE)
# Note : Idéalement, ces variables iront dans GameModel.gd plus tard.
# --------------------------------------------------------------------
var argent: int = 250000
var pers: int = 50
var persDispo: int = 50
var tours: int = 1
var moisJour: int = 1
var moisNuit: int = 0
var current_bat := "" # Bâtiment actuellement ouvert

# Dictionnaire de configuration des bâtiments
var batiments = {
	"principal": {
		"nom": "Batiment principal",
		"button": null, "panel": null, "bar": null, "label_pers": null, "label_common": null,
		"pers": 0, "etat": true, "cout": 300000, "tour_cout": 5, "reparation_restante": 0
	},
	"rech": {
		"nom": "Batiment recherche",
		"button": null, "panel": null, "bar": null, "label_pers": null, "label_common": null,
		"pers": 0, "etat": true, "cout": 100000, "tour_cout": 5, "reparation_restante": 0
	},
	"rech2": {
		"nom": "Batiment recherche 2",
		"button": null, "panel": null, "bar": null, "label_pers": null, "label_common": null,
		"pers": 0, "etat": true, "cout": 100000, "tour_cout": 5, "reparation_restante": 0
	},
	"antenne": {
		"nom": "Batiment antenne",
		"button": null, "panel": null, "bar": null, "label_pers": null, "label_common": null,
		"pers": 0, "etat": true, "cout": 500000, "tour_cout": 5, "reparation_restante": 0
	},
	"infirmerie": {
		"nom": "Batiment infirmerie",
		"button": null, "panel": null, "bar": null, "label_pers": null, "label_common": null,
		"pers": 0, "etat": true, "cout": 100000, "tour_cout": 5, "reparation_restante": 0
	},
	"restauration": {
		"nom": "Batiment restaurant",
		"button": null, "panel": null, "bar": null, "label_pers": null, "label_common": null,
		"pers": 0, "etat": true, "cout": 100000, "tour_cout": 5, "reparation_restante": 0
	},
	"stockage": {
		"nom": "Batiment stockage",
		"button": null, "panel": null, "bar": null, "label_pers": null, "label_common": null,
		"pers": 0, "etat": true, "cout": 100000, "tour_cout": 5, "reparation_restante": 0
	},
	"temps": {
		"nom": "Batiment temps marketing",
		"button": null, "panel": null, "bar": null, "label_pers": null, "label_common": null,
		"pers": 0, "etat": true, "cout": 250000, "tour_cout": 5, "reparation_restante": 0
	}
}

# --------------------------------------------------------------------
# 3. INITIALISATION (_READY)
# --------------------------------------------------------------------
func _ready() -> void:
	win_bar.min_value = 0
	win_bar.max_value = 100
	win_bar.value = 35

	argent_txt.text = "Argent : " + str(argent) + "€"
	
	# Masquer les fenêtres au démarrage
	all.visible = false
	commande_windows.visible = false
	bat_detruit_windows.visible = false
	
	# Initialisation manuelle des bâtiments (Liaison Code <-> Scène)
	# Assure-toi que les chemins ($...) correspondent à ta scène Game.tscn
	setup_batiment("principal", $bat_PrincipalWindows/VBoxContainer/Nom, $bat_Principal, $bat_PrincipalWindows, $bat_PrincipalWindows/VBoxContainer/etat_bat_Principal, $bat_PrincipalWindows/VBoxContainer/Personnes, $bat_PrincipalWindows/VBoxContainer/DonneesCommunes)
	setup_batiment("rech", $bat_rechWindows/VBoxContainer/Nom, $bat_rech_pousse, $bat_rechWindows, $bat_rechWindows/VBoxContainer/etat_bat_Rech, $bat_rechWindows/VBoxContainer/Personnes, $bat_rechWindows/VBoxContainer/DonneesCommunes)
	setup_batiment("rech2", $bat_rech2Windows/VBoxContainer/Nom, $bat_rech_pousse2, $bat_rech2Windows, $bat_rech2Windows/VBoxContainer/etat_bat_Rech2, $bat_rech2Windows/VBoxContainer/Personnes, $bat_rech2Windows/VBoxContainer/DonneesCommunes)
	setup_batiment("antenne", $bat_antenneWindows/VBoxContainer/Nom, $Antenne_market, $bat_antenneWindows, $bat_antenneWindows/VBoxContainer/etat_bat_Antenne, $bat_antenneWindows/VBoxContainer/Personnes, $bat_antenneWindows/VBoxContainer/DonneesCommunes)
	setup_batiment("infirmerie", $bat_infirmerieWindows/VBoxContainer/Nom, $bat_infirmerie, $bat_infirmerieWindows, $bat_infirmerieWindows/VBoxContainer/etat_bat_Infirmerie, $bat_infirmerieWindows/VBoxContainer/Personnes, $bat_infirmerieWindows/VBoxContainer/DonneesCommunes)
	setup_batiment("restauration", $bat_restaurationWindows/VBoxContainer/Nom, $bat_restauration, $bat_restaurationWindows, $bat_restaurationWindows/VBoxContainer/etat_bat_Restauration, $bat_restaurationWindows/VBoxContainer/Personnes, $bat_restaurationWindows/VBoxContainer/DonneesCommunes)
	setup_batiment("stockage", $bat_stockageWindows/VBoxContainer/Nom, $bat_stockage, $bat_stockageWindows, $bat_stockageWindows/VBoxContainer/etat_bat_Stockage, $bat_stockageWindows/VBoxContainer/Personnes, $bat_stockageWindows/VBoxContainer/DonneesCommunes)
	setup_batiment("temps", $bat_tempsWindows/VBoxContainer/Nom, $bat_temps_market, $bat_tempsWindows, $bat_tempsWindows/VBoxContainer/etat_bat_Temps, $bat_tempsWindows/VBoxContainer/Personnes, $bat_tempsWindows/VBoxContainer/DonneesCommunes)

	# Initialiser l'état visuel
	for key in batiments.keys():
		batiments[key].button.modulate = Color(1,1,1,1) # Ou 0 selon ton choix initial
		batiments[key].panel.visible = false

	_update_all_common_labels()


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
# 4. LOGIQUE DE JEU (CONTROLEUR)
# --------------------------------------------------------------------

func open_batiment(name: String) -> void:
	current_bat = name
	for key in batiments.keys():
		batiments[key].panel.visible = (key == name)
	all.visible = true # Active le bloqueur de clics

func open_destruct_batiment(name: String) -> void:
	nom_detruit.text = "Batiment " + name
	bat_detruit_windows.visible = true
	all.visible = true

func _on_fermer_pressed() -> void:
	all.visible = false
	for key in batiments.keys():
		batiments[key].panel.visible = false
	current_bat = ""

func _on_fermer_detruit_pressed() -> void:
	bat_detruit_windows.visible = false
	all.visible = false

# Gestion des personnes
func _update_all_common_labels() -> void:
	for key in batiments.keys():
		batiments[key].label_common.text = "Personnes disponibles : " + str(persDispo) + "/" + str(pers)
		batiments[key].label_pers.text = "Personnes : " + str(batiments[key].pers)

func _on_ajouter_pressed() -> void:
	if current_bat != "" and persDispo > 0:
		persDispo -= 1
		batiments[current_bat].pers += 1
		_update_all_common_labels()

func _on_retirer_pressed() -> void:
	if current_bat != "" and batiments[current_bat].pers > 0:
		persDispo += 1
		batiments[current_bat].pers -= 1
		_update_all_common_labels()

func _on_pdix_personnes_pressed() -> void:
	if current_bat != "" and persDispo > 0:
		var ajout = min(10, persDispo)
		persDispo -= ajout
		batiments[current_bat].pers += ajout
		_update_all_common_labels()

func _on_mdix_personnes_pressed() -> void:
	if current_bat != "":
		var retrait = min(10, batiments[current_bat].pers)
		batiments[current_bat].pers -= retrait
		persDispo += retrait
		_update_all_common_labels()

# --------------------------------------------------------------------
# 5. NAVIGATION ET SCENES (C'est ici que tu avais l'erreur)
# --------------------------------------------------------------------

# [cite_start]Bouton "Revenir" au menu principal [cite: 2]
func _on_revenir_pressed() -> void:
	# On s'assure de changer vers la bonne scène de menu
	# (Modifie le chemin si ton fichier est ailleurs, ex: res://Scenes/UI/MainMenu.tscn)
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu.tscn")

# [cite_start]Fonction helper pour changer vers Game Over [cite: 2]
func _change_to_game_over() -> void:
	# (Modifie le chemin selon ta nouvelle structure, ex: res://Scenes/UI/GameOver.tscn)
	get_tree().change_scene_to_file("res://Scenes/UI/GameOver.tscn")

# --------------------------------------------------------------------
# 6. RÉSOLUTION DU TOUR (PASSER)
# --------------------------------------------------------------------
func _on_passer_pressed() -> void:
	var argent_genere: int = 0
	var is_game_over: bool = false

	# Logique de dégradation/gain
	for key in batiments.keys():
		var b = batiments[key]

		if b.reparation_restante > 0:
			# Gestion de la réparation
			b.reparation_restante -= 1
			if b.reparation_restante == 0:
				b.etat = true
				b.bar.value = 50
				print(b.nom, " a été réparé !")
			continue # On passe au bâtiment suivant

		if b.etat == false:
			continue # Bâtiment détruit ne fait rien

		# Mise à jour état selon personnel
		var nb_pers = b.pers
		if nb_pers < 10:
			b.bar.value -= 10
		elif nb_pers > 19:
			b.bar.value += 20

		# Vérification destruction
		if b.bar.value <= 0:
			b.etat = false
			print(b.nom, " est détruit !")
			afficher_bouton_reparation(key)
		else:
			# Génération argent
			argent += 20000
			argent_genere += 20000

	# Mise à jour affichage argent
	argent_txt.text = "Argent : " + str(argent) + "€"

	# Calcul barre de survie globale
	for key in batiments.keys():
		var b = batiments[key]
		if b.reparation_restante > 0 or b.etat == false or b.bar.value < 50:
			win_bar.value -= 1
		else:
			win_bar.value += 1

	if win_bar.value <= 0:
		is_game_over = true

	tours += 1
	
	# Gestion Jour/Nuit (Simplifiée pour l'exemple)
	if moisNuit == 0:
		moisJour += 1
		if moisJour == 6:
			# Passage Nuit
			mode.text = "Mode Nuit"
			mode.add_theme_color_override("font_color", Color(0, 0, 0.5))
			persDispo = 10 # Réduction personnel
			pers = 10
			for k in batiments: batiments[k].pers = 0
			moisJour = 0
			_update_all_common_labels()
	
	elif moisJour == 0:
		moisNuit += 1
		if moisNuit == 6:
			# Passage Jour
			mode.text = "Mode Jour"
			mode.add_theme_color_override("font_color", Color(1, 1, 0, 1))
			persDispo = 50
			pers = 50
			for k in batiments: batiments[k].pers = 0
			moisNuit = 0
			_update_all_common_labels()

	if delais_commande_windows.visible:
		afficher_delais_reparations()

	if is_game_over:
		call_deferred("_change_to_game_over") # Appelle la fonction qu'on a ajoutée plus haut

# --------------------------------------------------------------------
# 7. FONCTIONS COMMANDES (Antenne & Réparations)
# --------------------------------------------------------------------
func afficher_bouton_reparation(key:String):
	var prix = batiments[key].cout
	var bouton = Button.new()
	bouton.text = "Reparer " + batiments[key].nom + " - " + str(prix) + "€"
	bouton.connect("pressed", Callable(self, "_reparer_batiment").bind(key, bouton))
	commande_vbox.add_child(bouton)

func _reparer_batiment(key:String, bouton:Button):
	var b = batiments[key]
	if argent >= b.cout:
		argent -= b.cout
		argent_txt.text = "Argent : " + str(argent) + "€"
		b.etat = false # Reste faux tant que pas réparé
		b.reparation_restante = b.tour_cout
		bouton.queue_free()
	else:
		print("Pas assez d'argent")

func _on_commander_pressed() -> void:
	commande_windows.visible = true

func _on_fermer_commande_pressed() -> void:
	commande_windows.visible = false

func _on_delais_commande_pressed() -> void:
	afficher_delais_reparations()
	delais_commande_windows.visible = true

func _on_fermer_delais_commande_pressed() -> void:
	delais_commande_windows.visible = false

func afficher_delais_reparations():
	# Nettoyer les labels existants (sauf le titre et bouton fermer)
	for c in delais_vbox.get_children():
		if c.name != "Temps_attente" and c.name != "fermer_delais_commande":
			c.queue_free()

	for key in batiments.keys():
		var b = batiments[key]
		if b.reparation_restante > 0:
			var label = Label.new()
			label.text = b.nom + " sera réparé dans " + str(b.reparation_restante) + " tours."
			delais_vbox.add_child(label)

# --------------------------------------------------------------------
# 8. SIGNALS BATIMENTS (OUVERTURE)
# --------------------------------------------------------------------
func _on_bat_principal_pressed() -> void:
	if batiments["principal"].etat: open_batiment("principal")
	else: open_destruct_batiment("principal")

func _on_bat_rech_pousse_pressed() -> void:
	if batiments["rech"].etat: open_batiment("rech")
	else: open_destruct_batiment("rech")

func _on_bat_rech_pousse_2_pressed() -> void:
	if batiments["rech2"].etat: open_batiment("rech2")
	else: open_destruct_batiment("rech2")

func _on_antenne_market_pressed() -> void:
	if batiments["antenne"].etat: open_batiment("antenne")
	else: open_destruct_batiment("antenne")

func _on_bat_infirmerie_pressed() -> void:
	if batiments["infirmerie"].etat: open_batiment("infirmerie")
	else: open_destruct_batiment("infirmerie")

func _on_bat_restauration_pressed() -> void:
	if batiments["restauration"].etat: open_batiment("restauration")
	else: open_destruct_batiment("restauration")

func _on_bat_stockage_pressed() -> void:
	if batiments["stockage"].etat: open_batiment("stockage")
	else: open_destruct_batiment("stockage")

func _on_bat_temps_market_pressed() -> void:
	if batiments["temps"].etat: open_batiment("temps")
	else: open_destruct_batiment("temps")
