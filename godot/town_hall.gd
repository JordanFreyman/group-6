extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_back_pressed() -> void:
	Global.switch_scene("res://demoMap.tscn")  # Go back to demo map
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
	Global.switch_scene("res://character.tscn")  # Switch to character creation scene

	#
	## Remove current scene
	#var current_scene = get_tree().current_scene
	#get_tree().root.add_child(character_scene)
	#get_tree().current_scene = character_scene
	#current_scene.queue_free()
