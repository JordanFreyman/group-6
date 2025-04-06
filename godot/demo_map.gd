extends Node2D

var menu_params: Dictionary = {}
var char_name: String = ""
var char_pronouns: int = 0
@export var menu_name = "menu"
@export var switch_to: String
signal menu_changed(menu_name)

func load_params(new_menu_params: Dictionary, new_char_name: String, new_char_pronouns: int):
	menu_params = new_menu_params
	char_name = new_char_name
	char_pronouns = new_char_pronouns

	# Insert the islander into the islanders[] list (assuming it's managed globally)
	Global.islanders.append({"name": char_name, "pronouns": char_pronouns, "appearance": menu_params})
	print("Islander added:", Global.islanders)
#ok cool it works now, but no data is being transferred. the goal is to have it so that when _on_done2_pressed() from character.gd is called,
#all the parameters get passed in through here, and that islander is created into an Islander object and inserted into the islanders[] list.

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
	switch_scene("res://food.tscn")


func _on_town_hall_2_pressed() -> void:
	switch_scene("res://town-hall.tscn")


func _on_homes_2_pressed() -> void:
	switch_scene("res://homes.tscn")
	#switch_to = "homes"
	#emit_signal("menu_changed", menu_name)
