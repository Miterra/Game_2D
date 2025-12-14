; Nom de l’installateur
OutFile "GlaciaInstaller.exe"

; Dossier d'installation par défaut
InstallDir "$PROGRAMFILES\Glacia"

Section "Glacia"
  SetOutPath "$INSTDIR"

  ; Copie l'exécutable
  File "C:\Users\Halil\Documents\iut\BUT_2\Projet_Jeu\Game_2D\exports\windows\Glacia_windows.exe"

  ; Copie le fichier de données Godot
  File "C:\Users\Halil\Documents\iut\BUT_2\Projet_Jeu\Game_2D\exports\windows\Glacia_windows.pck"
SectionEnd
