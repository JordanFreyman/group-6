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

func load_character_creator():
	current_menu = $Character
	current_menu.connect("menu_changed", handle_menu_changed)

func handle_menu_changed(current_menu_name: String):
	var next_menu_name = current_menu.switch_to
	var temp = load("res://"+next_menu_name+".tscn")
	next_menu = temp.instantiate()

	transfer_data_between_scenes(current_menu, next_menu)

	call_deferred("add_child", next_menu)
	next_menu.connect("menu_changed", handle_menu_changed)
	current_menu.queue_free()
	current_menu = next_menu
	next_menu = null
	

func transfer_data_between_scenes(old_scene, new_scene):
	#new_scene.currEyes = old_scene.currEyes
	new_scene.load_params(old_scene.menu_params, old_scene.char_name, old_scene.char_pronouns)
