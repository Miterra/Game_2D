; Nom de l’installateur
OutFile "exports\GlaciaInstaller.exe"

; Dossier par défaut d’installation
InstallDir "$PROGRAMFILES\Glacia"

Section ""
  SetOutPath "$INSTDIR"
  File "exports\Glacia.exe"
SectionEnd
