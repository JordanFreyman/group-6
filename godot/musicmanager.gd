extends Node

@onready var bgm_player := $bgmusic
@onready var bgm_player_alt := $bgmusic_alt

var current_player: AudioStreamPlayer
var next_player: AudioStreamPlayer
var current_track: String = ""
var is_first_track := true
var default_music_volume_db := -6.0

func _ready():
	current_player = bgm_player
	next_player = bgm_player_alt

func play_music(path: String, fade_time: float = 2.0):
	if path == current_track:
		return

	current_track = path
	var stream = load(path)

	if is_first_track:
		current_player.stream = stream
		current_player.volume_db = default_music_volume_db
		current_player.play()
		is_first_track = false
	else:
		# Swap players
		var temp = current_player
		current_player = next_player
		next_player = temp

		next_player.stream = stream
		next_player.volume_db = -80.0
		next_player.play()

		var tween = create_tween()
		tween.tween_property(current_player, "volume_db", -80.0, fade_time)
		tween.tween_property(next_player, "volume_db", default_music_volume_db, fade_time)
		tween.tween_callback(Callable(current_player, "stop"))
