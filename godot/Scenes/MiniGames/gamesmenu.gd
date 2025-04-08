extends Node2D

# guess a number between ? and ?
func switch_scene(target_scene: String):
	var new_scene = load(target_scene)
	if new_scene:
		get_tree().change_scene_to_packed(new_scene)
	else:
		print("Error: Could not load scene " + target_scene)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_cards_game_pressed() -> void:
	switch_scene("res://Scenes/MiniGames/CardsGame.tscn")


func _on_remember_me_pressed() -> void:
	switch_scene("res://Scenes/MiniGames/RememberMe.tscn")


func _on_rizz_game_pressed() -> void:
	switch_scene("res://Scenes/MiniGames/RizzGame.tscn")
