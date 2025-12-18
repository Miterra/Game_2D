extends Node2D

# 1. RÉFÉRENCES UI
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
@onready var menu_pause: PanelContainer = $Menu_pause

# Boutons Bâtiments (Référencés pour la transparence)
@onready var bat_principal_btn: Button = $bat_Principal
@onready var bat_rech_btn: Button = $bat_rech_pousse
@onready var bat_rech2_btn: Button = $bat_rech_pousse2
@onready var bat_antenne_btn: Button = $Antenne_market
@onready var bat_infirmerie_btn: Button = $bat_infirmerie
@onready var bat_restauration_btn: Button = $bat_restauration
@onready var bat_stockage_btn: Button = $bat_stockage
@onready var bat_temps_btn: Button = $bat_temps_market

# 2. INSTANCE DU MODÈLE
var game_model: GameModel
var current_bat_ui_key := ""
var batiments_ui = {}

func _ready() -> void:
	game_model = GameModel.new()
	add_child(game_model)
	
	win_bar.min_value = 0
	win_bar.max_value = 100
	
	# SETUP UI : On passe le bouton en paramètre pour pouvoir le cacher plus tard
	setup_batiment_ui("principal", $bat_Principal, $bat_PrincipalWindows, $bat_PrincipalWindows/VBoxContainer/etat_bat_Principal, $bat_PrincipalWindows/VBoxContainer/Personnes, $bat_PrincipalWindows/VBoxContainer/DonneesCommunes, $bat_PrincipalWindows/VBoxContainer/Nom)
	setup_batiment_ui("rech", $bat_rech_pousse, $bat_rechWindows, $bat_rechWindows/VBoxContainer/etat_bat_Rech, $bat_rechWindows/VBoxContainer/Personnes, $bat_rechWindows/VBoxContainer/DonneesCommunes, $bat_rechWindows/VBoxContainer/Nom)
	setup_batiment_ui("rech2", $bat_rech_pousse2, $bat_rech2Windows, $bat_rech2Windows/VBoxContainer/etat_bat_Rech2, $bat_rech2Windows/VBoxContainer/Personnes, $bat_rech2Windows/VBoxContainer/DonneesCommunes, $bat_rech2Windows/VBoxContainer/Nom)
	setup_batiment_ui("antenne", $Antenne_market, $bat_antenneWindows, $bat_antenneWindows/VBoxContainer/etat_bat_Antenne, $bat_antenneWindows/VBoxContainer/Personnes, $bat_antenneWindows/VBoxContainer/DonneesCommunes, $bat_antenneWindows/VBoxContainer/Nom)
	setup_batiment_ui("infirmerie", $bat_infirmerie, $bat_infirmerieWindows, $bat_infirmerieWindows/VBoxContainer/etat_bat_Infirmerie, $bat_infirmerieWindows/VBoxContainer/Personnes, $bat_infirmerieWindows/VBoxContainer/DonneesCommunes, $bat_infirmerieWindows/VBoxContainer/Nom)
	setup_batiment_ui("restauration", $bat_restauration, $bat_restaurationWindows, $bat_restaurationWindows/VBoxContainer/etat_bat_Restauration, $bat_restaurationWindows/VBoxContainer/Personnes, $bat_restaurationWindows/VBoxContainer/DonneesCommunes, $bat_restaurationWindows/VBoxContainer/Nom)
	setup_batiment_ui("stockage", $bat_stockage, $bat_stockageWindows, $bat_stockageWindows/VBoxContainer/etat_bat_Stockage, $bat_stockageWindows/VBoxContainer/Personnes, $bat_stockageWindows/VBoxContainer/DonneesCommunes, $bat_stockageWindows/VBoxContainer/Nom)
	setup_batiment_ui("temps", $bat_temps_market, $bat_tempsWindows, $bat_tempsWindows/VBoxContainer/etat_bat_Temps, $bat_tempsWindows/VBoxContainer/Personnes, $bat_tempsWindows/VBoxContainer/DonneesCommunes, $bat_tempsWindows/VBoxContainer/Nom)

	all.visible = false
	commande_windows.visible = false
	bat_detruit_windows.visible = false
	delais_commande_windows.visible = false
	menu_pause.visible = false

	# Masquer les fenêtres et rendre les boutons invisibles (Alpha 0)
	for key in batiments_ui:
		batiments_ui[key].panel.visible = false
		batiments_ui[key].button.modulate = Color(1, 1, 1, 0)
		batiments_ui[key].bar.modulate = Color.GREEN


	update_global_ui()
	_update_all_labels()
	
	print("--- DÉBUT DU JEU ---")
	print("Mode Jour : moisJour = " + str(game_model.moisJour))

func setup_batiment_ui(key: String, button, panel, bar, label_pers, label_comm, label_nom):
	batiments_ui[key] = {
		"button": button,
		"panel": panel,
		"bar": bar,
		"label_pers": label_pers,
		"label_common": label_comm,
		"label_nom": label_nom
	}
	
	# --- MISE A JOUR DU LABEL NOM ---
	var data = game_model.batiments_data[key]
	var texte_titre = data.nom
	texte_titre += "\nGain mensuel : " + str(data.gain_argent) + "€"
	texte_titre += " - Cout reparation : " + str(data.cout) + "€"
	texte_titre += "\nEtat du batiment :"
	
	label_nom.text = texte_titre
	bar.value = data.pv

# --- MISE A JOUR AFFICHAGE ---
func update_global_ui():
	argent_txt.text = "Argent : " + str(game_model.argent) + "€"
	win_bar.value = game_model.barre_survie
	
	if game_model.is_night_mode:
		mode.text = "Mode Nuit (" + str(game_model.moisNuit) + "/6)"
		mode.add_theme_color_override("font_color", Color(0, 0, 0.5))
	else:
		mode.text = "Mode Jour (" + str(game_model.moisJour) + "/6)"
		mode.add_theme_color_override("font_color", Color(1, 1, 0, 1))

func _update_all_labels() -> void:
	for key in batiments_ui:
		var ui = batiments_ui[key]
		var data = game_model.batiments_data[key]
		
		ui.label_common.text = "Personnes disponibles : " + str(game_model.pers_dispo) + "/" + str(game_model.pers_totales)
		ui.label_pers.text = "Personnes : " + str(data.pers)
		ui.bar.value = data.pv

# --- LOGIQUE PASSER TOUR ---
func _on_passer_pressed() -> void:
	var game_status = game_model.passer_tour()
	
	for key in game_model.batiments_data:
		var data = game_model.batiments_data[key]
		if not data.etat and data.pv <= 0:
			afficher_bouton_reparation(key)

	for key in batiments_ui.keys():
		var ui_elements = batiments_ui[key]
		var bar = ui_elements.bar 
		var data = game_model.batiments_data[key]
		
		if data.pv >= 50:
			bar.modulate = Color.GREEN
		elif data.pv >= 30 and data.pv < 50:
			bar.modulate = Color.YELLOW
		elif data.pv < 30:
			bar.modulate = Color.RED

	update_global_ui()
	_update_all_labels()
	
	if delais_commande_windows.visible:
		afficher_delais_reparations()

	# --- GESTION FIN DE JEU ---
	if game_status == 1:
		_change_to_game_over()
	elif game_status == 2:
		_change_to_game_win()

# --- GESTION FENÊTRES ---
func open_batiment(key: String) -> void:
	var data = game_model.batiments_data[key]
	if data.etat:
		current_bat_ui_key = key
		for k in batiments_ui:
			batiments_ui[k].panel.visible = (k == key)
		all.visible = true
	else:
		open_destruct_batiment(data.nom)

func open_destruct_batiment(bat_name: String) -> void:
	nom_detruit.text = "Batiment " + bat_name
	bat_detruit_windows.visible = true
	all.visible = true

func _on_fermer_pressed() -> void:
	all.visible = false
	for k in batiments_ui:
		batiments_ui[k].panel.visible = false
	current_bat_ui_key = ""

# --- GESTION PERSONNEL ---
func _on_ajouter_pressed() -> void:
	if current_bat_ui_key != "" and game_model.pers_dispo > 0:
		game_model.pers_dispo -= 1
		game_model.batiments_data[current_bat_ui_key].pers += 1
		_update_all_labels()

func _on_retirer_pressed() -> void:
	if current_bat_ui_key != "":
		var data = game_model.batiments_data[current_bat_ui_key]
		if data.pers > 0:
			game_model.pers_dispo += 1
			data.pers -= 1
			_update_all_labels()

func _on_pdix_personnes_pressed() -> void:
	if current_bat_ui_key != "" and game_model.pers_dispo > 0:
		var ajout = min(10, game_model.pers_dispo)
		game_model.pers_dispo -= ajout
		game_model.batiments_data[current_bat_ui_key].pers += ajout
		_update_all_labels()

func _on_mdix_personnes_pressed() -> void:
	if current_bat_ui_key != "":
		var data = game_model.batiments_data[current_bat_ui_key]
		var retrait = min(10, data.pers)
		data.pers -= retrait
		game_model.pers_dispo += retrait
		_update_all_labels()


# --- REPARATIONS ET COMMANDES ---
func afficher_bouton_reparation(key:String):
	var btn_name = "reparer_" + key
	if commande_vbox.has_node(btn_name): return
	
	var data = game_model.batiments_data[key]
	var bouton = Button.new()
	bouton.name = btn_name
	bouton.text = "Reparer " + data.nom + " - " + str(data.cout) + "€"
	bouton.connect("pressed", Callable(self, "_reparer_batiment").bind(key, bouton))
	commande_vbox.add_child(bouton)

func _reparer_batiment(key:String, bouton:Button):
	# --- VERIF ANTENNE ---
	if key != "antenne":
		if game_model.batiments_data["antenne"].etat == false:
			print("IMPOSSIBLE : L'antenne est détruite !")
			return 
	
	# --- REPARATION ---
	var data = game_model.batiments_data[key]
	if game_model.argent >= data.cout:
		game_model.argent -= data.cout
		game_model.argent_depense += data.cout
		
		update_global_ui()
		data.reparation_restante = data.tour_cout
		
		# On supprime le bouton car c'est payé
		bouton.queue_free()
		
		# ASTUCE : On attend une micro-seconde que le bouton soit bien supprimé de la mémoire
		# avant de vérifier s'il reste des boutons, sinon le compte sera faux.
		await get_tree().process_frame 
		verifier_etat_commandes() # <--- AJOUT DE L'APPEL ICI
		
	else:
		print("Pas assez d'argent pour réparer", data.nom)

func _on_commander_pressed() -> void:
	commande_windows.visible = true
	verifier_etat_commandes()

func _on_fermer_commande_pressed() -> void:
	commande_windows.visible = false
	
func _on_delais_commande_pressed() -> void:
	afficher_delais_reparations()
	delais_commande_windows.visible = true

func _on_fermer_delais_commande_pressed() -> void:
	delais_commande_windows.visible = false


func verifier_etat_commandes():
	# 1. On compte s'il y a des boutons de réparation
	var nb_boutons_reparation = 0
	for child in commande_vbox.get_children():
		# On compte les boutons qui ne sont PAS le bouton fermer
		if child is Button and child.name != "fermer_commande":
			nb_boutons_reparation += 1

	# 2. On vérifie si le label existe déjà
	var nom_label = "LabelRienAFaire"
	var label_existe = commande_vbox.has_node(nom_label)

	# --- CAS 1 : Aucune réparation à faire (On veut le message) ---
	if nb_boutons_reparation == 0:
		# On ne le crée QUE s'il n'existe pas encore
		if not label_existe:
			var label = Label.new()
			label.name = nom_label
			label.text = "Aucune reparation a faire pour le moment."
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			
			# Style
			label.add_theme_color_override("font_color", Color.BLACK)
			label.add_theme_font_size_override("font_size", 40)
			
			commande_vbox.add_child(label)
			
			# Positionnement au-dessus du bouton fermer
			if commande_vbox.has_node("fermer_commande"):
				var btn_fermer = commande_vbox.get_node("fermer_commande")
				commande_vbox.move_child(label, btn_fermer.get_index())
	
	# --- CAS 2 : Il y a des réparations (On ne veut PAS le message) ---
	else:
		# Si le label existe, on le supprime
		if label_existe:
			commande_vbox.get_node(nom_label).queue_free()



func afficher_delais_reparations():

	for c in delais_vbox.get_children():
		if c.name != "Temps_attente" and c.name != "fermer_delais_commande":
			c.queue_free()

	var index_insertion = 1
	
	for key in game_model.batiments_data:
		var data = game_model.batiments_data[key]
		if data.reparation_restante > 0:
			var label = Label.new()
			label.text = "- " + data.nom + " : " + str(data.reparation_restante) + " mois restants"
			
			# --- STYLE ---
			label.add_theme_color_override("font_color", Color(1, 0.2, 0.2)) 
			label.add_theme_font_size_override("font_size", 24)
			
			# --- POSITIONNEMENT ---
			delais_vbox.add_child(label)
			delais_vbox.move_child(label, index_insertion)
			index_insertion += 1

func _on_fermer_detruit_pressed() -> void:
	bat_detruit_windows.visible = false
	all.visible = false

# --- NAVIGATION ---
func _on_revenir_pressed() -> void:
	menu_pause.visible = true

func _on_reprendre_pressed() -> void:
	menu_pause.visible = false

func _on_quitter_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu.tscn")

func _change_to_game_over() -> void:
	# 1. On récupère les stats (même en cas de défaite, le modèle connait le tour actuel)
	var stats = game_model.recuperer_stats_finales()
	
	# 2. On sauvegarde dans la mémoire globale
	GameData.stats_fin_de_partie = stats
	
	# 3. On change de scène
	get_tree().change_scene_to_file("res://Scenes/UI/GameOver.tscn")

func _change_to_game_win() -> void:
	# 1. On demande au modèle de calculer le score
	var stats = game_model.recuperer_stats_finales()
	
	# 2. On sauvegarde ça dans la mémoire globale (Singleton)
	GameData.stats_fin_de_partie = stats
	
	# 3. On change de scène
	get_tree().change_scene_to_file("res://Scenes/UI/GameWin.tscn")

# --- SIGNAUX OUVERTURE BATIMENTS ---
func _on_bat_principal_pressed() -> void: open_batiment("principal")
func _on_bat_rech_pousse_pressed() -> void: open_batiment("rech")
func _on_bat_rech_pousse_2_pressed() -> void: open_batiment("rech2")
func _on_antenne_market_pressed() -> void: open_batiment("antenne")
func _on_bat_infirmerie_pressed() -> void: open_batiment("infirmerie")
func _on_bat_restauration_pressed() -> void: open_batiment("restauration")
func _on_bat_stockage_pressed() -> void: open_batiment("stockage")
func _on_bat_temps_market_pressed() -> void: open_batiment("temps")
