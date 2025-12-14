#!/bin/bash

# Nom du jeu
APP_NAME="Glacia"

# Dossier temporaire pour le bundle
BUNDLE_DIR="$APP_NAME.app/Contents"
MACOS_DIR="$BUNDLE_DIR/MacOS"
RESOURCES_DIR="$BUNDLE_DIR/Resources"

# Nettoyer ancien build
rm -rf "$APP_NAME.app"
rm -f "$APP_NAME-mac.zip"

# Créer la structure du bundle
mkdir -p "$MACOS_DIR"
mkdir -p "$RESOURCES_DIR"

# Copier le binaire exporté par Godot
cp "$PWD/Glacia" "$MACOS_DIR/$APP_NAME"
chmod +x "$MACOS_DIR/$APP_NAME"

# Copier le .pck
cp "$PWD/Glacia.pck" "$RESOURCES_DIR/$APP_NAME.pck"

# Créer le fichier Info.plist minimal
cat > "$BUNDLE_DIR/Info.plist" <<EOL
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" 
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleName</key>
    <string>$APP_NAME</string>
    <key>CFBundleExecutable</key>
    <string>$APP_NAME</string>
    <key>CFBundleIdentifier</key>
    <string>com.tonnom.$APP_NAME</string>
    <key>CFBundleVersion</key>
    <string>1.0</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
</dict>
</plist>
EOL

# Créer le zip final pour GitLab
zip -r "$APP_NAME-mac.zip" "$APP_NAME.app"

echo "Bundle .app et zip créés avec succès !"
