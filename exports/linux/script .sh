#!/bin/bash

# Nom du jeu
APP_NAME="Glacia"
INSTALL_DIR="$HOME/$APP_NAME"

echo "Installation de $APP_NAME dans $INSTALL_DIR"

# Créer le dossier d'installation
mkdir -p "$INSTALL_DIR"

# Copier le binaire et le .pck
cp Glacia.x86_64 "$INSTALL_DIR/$APP_NAME"
chmod +x "$INSTALL_DIR/$APP_NAME"

cp Glacia.pck "$INSTALL_DIR/"

# Créer un script de lancement
LAUNCHER="$INSTALL_DIR/run.sh"
cat > "$LAUNCHER" <<EOL
#!/bin/bash
cd "$INSTALL_DIR"
./$APP_NAME
EOL
chmod +x "$LAUNCHER"

# Optionnel : créer un alias dans ~/.bashrc pour lancer le jeu depuis n’importe où
echo "alias $APP_NAME='$LAUNCHER'" >> ~/.bashrc

echo "Installation terminée !"
echo "Pour lancer le jeu, tapez : $APP_NAME"
echo "Ou utilisez : $LAUNCHER"
