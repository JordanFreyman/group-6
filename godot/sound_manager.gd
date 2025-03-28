extends Node

@onready var sfx_player := $SFXPlayer

func play_sfx(path: String):
	var stream = load(path)
	sfx_player.stream = stream
	sfx_player.play()
