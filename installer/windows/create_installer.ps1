# Powershell script pour créer un installateur NSIS
$nsis_path = "C:\Program Files (x86)\NSIS\makensis.exe"
$script = "installer_script.nsi" # fichier NSIS à créer
& $nsis_path $script
