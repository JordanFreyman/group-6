extends Node
var next_menu = null

@onready var current_menu = null

func _ready() -> void:
	if save_file_exists():
		load_demo_map()
	else:
		load_character_creator()

func save_file_exists() -> bool:
	var dir = DirAccess.open("user://")
	return dir != null and dir.file_exists("islanders_save.json")

func load_demo_map():
	var demo_scene = load("res://demoMap.tscn")
	var demo_instance = demo_scene.instantiate()
	add_child(demo_instance)
	current_menu = demo_instance
	current_menu.connect("menu_changed", handle_menu_changed)

func load_character_creator():
	current_menu = $Character
	current_menu.connect("menu_changed", handle_menu_changed)

func handle_menu_changed(current_menu_name: String):
	print("Switching from:", current_menu_name)  
	var next_menu_name = current_menu.switch_to
	var temp = load("res://"+next_menu_name+".tscn")
	next_menu = temp.instantiate()

	transfer_data_between_scenes(current_menu, next_menu)

	call_deferred("add_child", next_menu)
	next_menu.connect("menu_changed", handle_menu_changed)
	current_menu.queue_free()
	current_menu = next_menu
	next_menu = null
	print("Switching to:", next_menu_name)       
	

func transfer_data_between_scenes(old_scene, new_scene):
	if new_scene.has_method("load_params"):
		var default_menu_params := {
			"currHead": 0,
			"currShirt": 0,
			"currPants": 0,
			"currEyebrows": 0,
			"currEyes": 0,
			"currHair": 0,
			"currNose": 0,
			"currMouth": 0
		}

		var temp_params = old_scene.get("menu_params") if old_scene.has_method("get") else null
		var final_menu_params = temp_params if typeof(temp_params) == TYPE_DICTIONARY else default_menu_params

		for key in default_menu_params.keys():
			if not final_menu_params.has(key):
				final_menu_params[key] = default_menu_params[key]

		var char_name = old_scene.get("char_name") if old_scene.has_method("get") else ""
		var char_pronouns = old_scene.get("char_pronouns") if old_scene.has_method("get") else 0
		var house_num = old_scene.get("house_num") if old_scene.has_method("get") else 1

		new_scene.load_params(
			final_menu_params,
			char_name,
			char_pronouns,
			house_num
		)
