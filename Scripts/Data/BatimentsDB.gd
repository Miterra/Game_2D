class_name BatimentsDB
extends Node

# Cette fonction retourne le dictionnaire de base.
# On l'appelle quand on veut initialiser ou recommencer le jeu.
static func get_default_data() -> Dictionary:
	return {
		"principal": { 
			"nom": "Batiment principal", 
			"pers": 0, 
			"etat": true, 
			"cout": 300000, 
			"reparation_restante": 0, 
			"tour_cout": 5, 
			"pv": 70, 
			"gain_argent": 20000 
		},
		"rech": { 
			"nom": "Batiment recherche", 
			"pers": 0, 
			"etat": true, 
			"cout": 100000, 
			"reparation_restante": 0, 
			"tour_cout": 5, 
			"pv": 70, 
			"gain_argent": 20000 
		},
		"rech2": { 
			"nom": "Batiment recherche 2", 
			"pers": 0, 
			"etat": true, 
			"cout": 100000, 
			"reparation_restante": 0, 
			"tour_cout": 5, 
			"pv": 70, 
			"gain_argent": 20000 
		},
		"antenne": { 
			"nom": "Batiment antenne", 
			"pers": 0, 
			"etat": true, 
			"cout": 500000, 
			"reparation_restante": 0, 
			"tour_cout": 5, 
			"pv": 70, 
			"gain_argent": 20000 
		},
		"infirmerie": { 
			"nom": "Batiment infirmerie", 
			"pers": 0, 
			"etat": true, 
			"cout": 100000, 
			"reparation_restante": 0, 
			"tour_cout": 5, 
			"pv": 70, 
			"gain_argent": 20000 
		},
		"restauration": { 
			"nom": "Batiment restaurant", 
			"pers": 0, 
			"etat": true, 
			"cout": 100000, 
			"reparation_restante": 0, 
			"tour_cout": 5, 
			"pv": 70, 
			"gain_argent": 20000 
		},
		"stockage": { 
			"nom": "Batiment stockage", 
			"pers": 0, 
			"etat": true, 
			"cout": 100000, 
			"reparation_restante": 0, 
			"tour_cout": 5, 
			"pv": 70, 
			"gain_argent": 20000 
		},
		"temps": { 
			"nom": "Batiment temps marketing", 
			"pers": 0, 
			"etat": true, 
			"cout": 250000, 
			"reparation_restante": 0, 
			"tour_cout": 5, 
			"pv": 70, 
			"gain_argent": 20000 
		}
	}
