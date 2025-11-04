extends ColorRect

@onready var volume_slider = $Panel/VolumeSlider
@onready var volume_label = $Panel/VolumeLabel
@onready var close_button = $Panel/btnClose

func _ready():
	visible = false  # Cache l’overlay au démarrage

	if AudioMenu:  # Ton autoload musique
		var value = clamp((AudioMenu.volume_db + 80) / 80 * 100, 0, 100)
		volume_slider.value = value
		volume_label.text = str(round(value)) + "%"
	
	# Connecte les signaux
	volume_slider.connect("value_changed", Callable(self, "_on_volume_changed"))
	close_button.connect("pressed", Callable(self, "_on_close_pressed"))


func _on_volume_changed(value):
	var db_value = lerp(-80, 0, value / 100.0)
	AudioMenu.volume_db = db_value
	volume_label.text = str(round(value)) + "%"


func _on_close_pressed():
	visible = false
