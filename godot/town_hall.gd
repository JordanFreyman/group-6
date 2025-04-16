extends Node2D
@export var switch_to: String
@export var menu_name = "town_hall"
signal menu_changed(menu_name)
var menu_params = {}
var char_name = ""
var char_pronouns = 0
var house_num = 0

# Called when the node enters the scene tree for the first time.
func load_params(new_menu_params: Dictionary, new_char_name: String, new_char_pronouns: int, new_house_num: int):
	# Not needed right now, but defined for scene_manager.gd compatibility
	menu_params = new_menu_params
	char_name = new_char_name
	char_pronouns = new_char_pronouns
	house_num = new_house_num

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:		
	pass

func _on_back_pressed() -> void:
	switch_to = "demoMap"  # or "character", or whatever scene name you want
	emit_signal("menu_changed", menu_name)
	#var demo_map_scene = load("res://demoMap.tscn").instantiate()
	#get_tree().root.add_child(demo_map_scene)

func delete_save_file():
	Global.islanders.clear()
	var dir = DirAccess.open("user://")
	if dir.file_exists("islanders_save.json"):
		var err = dir.remove("islanders_save.json")
		if err == OK:
			print("Save file deleted")
		else:
			print("Failed to delete save file")
	else:
		print("No save file to delete")


func _on_delete_pressed() -> void:
	delete_save_file()


func _on_create_pressed() -> void:
	switch_to = "character"  # or "character", or whatever scene name you want
	emit_signal("menu_changed", menu_name)

	#Global.switch_scene("res://character.tscn")  # Switch to character creation scene

	#
	## Remove current scene
	#var current_scene = get_tree().current_scene
	#get_tree().root.add_child(character_scene)
	#get_tree().current_scene = character_scene
	#current_scene.queue_free()
