class_name GameModel
extends Node

# Données pures
var argent: int = 250000
var pers_totales: int = 50
var pers_dispo: int = 50
var tour_actuel: int = 1
var mois_jour: int = 1
var mois_nuit: int = 0
var barre_survie: int = 35

# Ton dictionnaire de bâtiments (sans les références UI comme "button" ou "panel")
var batiments_data = {
	"principal": { "nom": "Batiment principal", "pers": 0, "etat": true, "cout": 300000, "reparation": 0 },
	"rech": { "nom": "Batiment recherche", "pers": 0, "etat": true, "cout": 100000, "reparation": 0 },
	# ... ajoute les autres ici ...
}

# Fonction pour calculer la fin du tour (Logique pure)
func passer_tour():
	var gain_argent = 0
	for key in batiments_data:
		var b = batiments_data[key]
		if b.etat:
			gain_argent += 20000
			# Logique de dégradation/amélioration selon le nombre de personnes
			# ... ton code de calcul ici ...
	
	argent += gain_argent
	tour_actuel += 1
	# ... gestion jour/nuit ...
