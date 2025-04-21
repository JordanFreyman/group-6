extends Node

var intro_shown := false
var islanders: Array = []  # Global list to store all islanders
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
