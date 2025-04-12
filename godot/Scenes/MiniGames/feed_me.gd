extends Node2D

var menu_params: Dictionary = {}
var char_name: String = "[empty name]"
var char_pronouns: int = 0
@export var menu_name = "menu"
@export var switch_to: String
signal menu_changed(menu_name)

var CharacterFoodPreferences = [
	{"Character": "John", "fav": "Bread", "Okay": "Salmon", "Gross": "Cake"},
	{"Character": "Brad", "fav": "Cake", "Okay": "Roast Beef", "Gross": "Jam"},
	{"Character": "Sanbo", "fav": "Roast Beef", "Okay": "Chicken", "Gross": "Cheese"},
	{"Character": "Layla", "fav": "Cheese", "Okay": "Jam", "Gross": "Salmon"},
	{"Character": "Alice", "fav": "Chicken", "Okay": "Bread", "Gross": "Roast Beef"},
	{"Character": "Wart", "fav": "Eel", "Okay": "Salmon", "Gross": "Bread"},
	{"Character": "Crystal", "fav": "Jam", "Okay": "Cake", "Gross": "Chicken"}
]
var FoodArray = ["Bread", "Salmon", "Cake", "Roast Beef", "Jam", "Cheese", "Chicken", "Eel"]

var current_choices: Array = []
var current_character: Dictionary
var character_social_points = 34
var food_given = 0

func _ready() -> void:
	$Food.modulate.a = 0.5
	# Connect buttons to handler with indices
	$Food1.pressed.connect(_on_button_selected.bind(0))
	$Food2.pressed.connect(_on_button_selected.bind(1))
	$Food3.pressed.connect(_on_button_selected.bind(2))
	initialize_character_and_choices()

func initialize_character_and_choices():
	# Clear previous choices
	current_choices.clear()
	food_given = 0
	
	# Select random character
	current_character = CharacterFoodPreferences.pick_random()
	
	# Generate 3 unique random food choices
	var available_foods = FoodArray.duplicate()
	for i in 3:
		if available_foods.is_empty():
			break
		var random_index = randi() % available_foods.size()
		current_choices.append(available_foods[random_index])
		available_foods.remove_at(random_index)
	
	# Update UI
	update_ui()

func update_ui():
	# Set character name
	$Label3.text = current_character["Character"]
	
	# Set button texts
	$Food1.text = current_choices[0] if current_choices.size() > 0 else ""
	$Food2.text = current_choices[1] if current_choices.size() > 1 else ""
	$Food3.text = current_choices[2] if current_choices.size() > 2 else ""
	
	# Update social points display
	characterLabels()

func _on_button_selected(index: int):
	if index >= current_choices.size():
		return
	
	food_given += 1
	if(food_given > 5):
		$Label.text = "Uhh, I don't need anymore food."
		characterLabels()
		return
	
	var selected_food = current_choices[index]
	
	# Determine reaction type
	var reaction: String
	if selected_food == current_character["fav"]:
		reaction = "fav"
	elif selected_food == current_character["Okay"]:
		reaction = "Okay"
	elif selected_food == current_character["Gross"]:
		reaction = "Gross"
	else:
		reaction = "Unknown"
	
	# Update social points
	match reaction:
		"fav":
			character_social_points += 10
			$Label.text = "Oh! That's my favorite! Thank you!"
		"Okay":
			character_social_points += 1
			$Label.text = "Okay...Thanks."
		"Gross":
			character_social_points -= 8
			$Label.text = "Ew! Thats gross!"
		_:
			character_social_points -= 5  # Default penalty for unknown food
			$Label.text = "Uhh... I don't know what that is..."
	
	# Update UI and prepare for next interaction
	characterLabels()


func characterLabels():
	$Label2.text = "RelationshipPoints: " + str(character_social_points)

func _on_next_pressed() -> void:
	initialize_character_and_choices()
func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://demoMap.tscn")
