$nsis_path = "C:\Program Files (x86)\NSIS\makensis.exe"
$script = "$PSScriptRoot\installer_script.nsi"
& $nsis_path $script
