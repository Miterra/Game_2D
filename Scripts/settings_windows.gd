extends PanelContainer

#@onready var volume_slider = $VolumeSlider
#@onready var volume_label = $VolumeLabel


@export var volume_slider : NodePath
@export var volume_label : NodePath

func _ready():
	visible = false  # Cache l’overlay au démarrage

	if AudioMenu:  # Ton autoload musique
		var value = clamp((AudioMenu.volume_db + 80) / 80 * 100, 0, 100)
		get_node(volume_slider).value = value
		get_node(volume_label).text = str(round(value)) + "%"
	
	# Connecte les signaux
	get_node(volume_slider).connect("value_changed", Callable(self, "_on_volume_changed"))


func _on_volume_changed(value):
	var db_value = lerp(-80, 0, value / 100.0)
	AudioMenu.volume_db = db_value
	get_node(volume_label).text = str(round(value)) + "%"


func _on_close_pressed():
	visible = false
