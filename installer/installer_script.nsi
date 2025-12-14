; Nom de l’installateur
OutFile "exports\GlaciaInstaller.exe"

; Dossier par défaut d’installation
InstallDir "$PROGRAMFILES\Glacia"

Section "Glacia"
  SetOutPath "$INSTDIR"

  ; Exécutable du jeu
  File "C:\Users\Halil\Documents\iut\BUT_2\Projet_Jeu\Game_2D\exports\Glacia.exe"

  ; Données du jeu (OBLIGATOIRE)
  File "C:\Users\Halil\Documents\iut\BUT_2\Projet_Jeu\Game_2D\exports\Glacia.pck"
SectionEnd
