# ❄️ Glacia

**Glacia** est un jeu de **gestion, de survie et de recherche** en Antarctique, développé avec **Godot Engine**.  
Le joueur doit gérer une station scientifique composée de **8 bâtiments**, maintenir le **moral** et la **population** des scientifiques, et faire face aux conditions extrêmes.

<<<<<<< HEAD
=======

---

🎮 Jouer au jeu

👉 https://miterra.itch.io/glacia

>>>>>>> 62ae48b (Sync README GitHub)
---

## 🎯 Objectifs du jeu
- Survie et gestion de la population scientifique  
- Gestion du **moral** et de l’état des bâtiments  
- Optimisation des **ressources financières** pour réparer et maintenir les bâtiments  
- Anticipation du mode **jour → nuit** après 6 mois, où la population chute drastiquement  

---

## 🏢 Bâtiments

| État du bâtiment | Population | Effet |
|-----------------|------------|-------|
| Moins de 10     | 0–9        | ❌ Détérioration |
| Entre 10 et 19  | 10–19      | ⚠️ Stabilité |
| Plus de 19      | 20+        | ✅ Amélioration |

> ⚠️ Si un bâtiment est <50% après un mois → **moral -1%**  

---

## 📊 Moral / Barre de survie
- Valeur initiale : **100%**  
- Baisse si des bâtiments sont mal gérés  
- **Moral = 0 → Game Over** 🚨  

---

## 👥 Population
- Population totale : **50 personnes** réparties dans les bâtiments  
- Après 6 mois → **mode nuit** : population totale = **10**  
- Importance : maintenir la population pour éviter la dégradation des bâtiments  

---

## 💰 Budget et ressources
- Budget : **20 000 € par bâtiment / mois** → 160 000 € total  
- Achat de ressources pour **réparer les bâtiments détruits (0%)**  
- Livraison : **5 mois après l’achat**  
- Après livraison → bâtiment réparé ✅  

---

## 🖥️ Interface
- Barre de chaque bâtiment indiquant l’état (%)  
- Barre globale indiquant le **moral**  
- Indicateur de population par bâtiment  
- 🔴 Alerte si bâtiment <50% ou population trop faible  
- ⏳ Compteur de livraison de ressources  

---

## ⚙️ Contraintes techniques
- Développement avec **Godot Engine**  
- Jeu en 2D, type **simulation de station scientifique**  
- Sauvegarde automatique mensuelle de l’état  
- Simulation mensuelle pour les bâtiments et le moral  

---

## 🎮 Stratégie
- Répartir la population de manière optimale  
- Planifier le budget pour anticiper les réparations (livraison 5 mois plus tard)  
- Préparer le **mode nuit** pour maintenir le moral  

---

## 👥 Équipe
- **Halil Bronja** : développement Godot, gestion des bâtiments et du moral  
- **Matteo Stroher** : ressources, interface et design graphique  
- **Victor Hatt** : ancien membre, plus actif  

---

## 🚀 Améliorations futures
- Événements aléatoires : tempêtes, pannes, maladies 🌪️❄️🦠  
- Niveaux de difficulté ou modes de jeu alternatifs  
- Amélioration de l’interface et animations pour le moral et les bâtiments  

---

## 📅 Timeline / Gestion des mois
| Mois | Population totale | Événements |
|------|-----------------|-----------|
| 1–5  | 50               | Normal |
| 6    | 10               | Mode nuit, difficultés augmentées |
| 7+   | Variable         | Survie critique, gestion des ressources essentielles |
