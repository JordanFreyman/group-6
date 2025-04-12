extends Node2D

var menu_params: Dictionary = {}
var char_name: String = ""
var char_pronouns: int = 0
@export var menu_name = "demoMap"
@export var switch_to: String
signal menu_changed(menu_name)

func save_islanders():
	var save_data = {
		"islanders": Global.islanders
	}
	var file = FileAccess.open("user://islanders_save.json", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data))
		file.close()
		print("Islanders saved.")
	else:
		print("Failed to open save file.")

func load_islanders():
	if not FileAccess.file_exists("user://islanders_save.json"):
		print("No save file found.")
		return
	var file = FileAccess.open("user://islanders_save.json", FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var result = JSON.parse_string(content)
		if result and typeof(result) == TYPE_DICTIONARY:
			Global.islanders = result["islanders"]
			print("Islanders loaded :3")
		file.close()

func load_params(new_menu_params: Dictionary, new_char_name: String, new_char_pronouns: int):
	menu_params = new_menu_params
	char_name = new_char_name
	char_pronouns = new_char_pronouns

	#Global.islanders.append({"name": char_name, "pronouns": char_pronouns, "appearance": menu_params})
	print("Islander added:", Global.islanders)

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func switch_scene(target_scene: String):
	var new_scene = load(target_scene)
	if new_scene:
		get_tree().change_scene_to_packed(new_scene)
	else:
		print("Error: Could not load scene " + target_scene)


func _on_food_2_pressed() -> void:
	switch_scene("res://Scense/MiniGames/FeedMe.tscn")

func _on_town_hall_2_pressed() -> void:
	switch_scene("res://town-hall.tscn")

func _on_homes_2_pressed() -> void:
	switch_scene("res://homes.tscn")
	#switch_to = "homes"
	#emit_signal("menu_changed", menu_name)

func _on_minigames_pressed() -> void:
	switch_scene("res://Scenes/MiniGames/gamesmenu.tscn")

func _on_save_pressed() -> void:
	save_islanders()

func _on_delete_pressed() -> void:
	Global.delete_save_file()
