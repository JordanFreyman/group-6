extends Node

@onready var bgm_player := $bgmusic

var current_track: String = ""

func play_music(path: String):
	if path != current_track:
		var stream = load(path)
		bgm_player.stream = stream
		bgm_player.play()
		current_track = path
