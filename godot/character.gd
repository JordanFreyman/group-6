extends Node2D

var project_dir = "C:/Users/jfrey/Documents/GitHub/group-6/godot"  # Set your actual project path
var interpreter_path = project_dir.path_join("venv/Scripts/python.exe")
var script_path = project_dir.path_join("islander.py")


signal menu_changed(menu_name)

@onready var headSprite = $CompositeSprites/Head
@onready var shirtSprite = $CompositeSprites/Shirt
@onready var pantsSprite = $CompositeSprites/Pants
@onready var eyebrowsSprite = $CompositeSprites/Eyebrows
@onready var eyesSprite = $CompositeSprites/Eyes
@onready var hairSprite = $CompositeSprites/Hair
@onready var noseSprite = $CompositeSprites/Nose
@onready var mouthSprite = $CompositeSprites/Mouth

var menu_params := {
	"currHead": 0,
	"currShirt": 0,
	"currPants": 0,
	"currEyebrows": 0,
	"currEyes": 0,
	"currHair": 0,
	"currNose": 0,
	"currMouth": 0
}

@export var menu_name = "menu"
@export var switch_to: String

var char_name : String
var char_pronouns = 3
var pronouns = {
	0: ["he", "him", "his", "his", "himself"],
	1: ["she", "her", "her", "hers", "herself"],
	2: ["they", "them", "their", "theirs", "themselves"]
}

func load_params(new_menu_params: Dictionary, new_char_name: String, new_char_pronouns: int):
	menu_params = new_menu_params
	char_name = new_char_name
	char_pronouns = new_char_pronouns

func _ready():
	Music.play_music("res://Music/chicken dance song.mp3")
	print("Python Interpreter Path:", interpreter_path)
	print("Script Path:", script_path)
	var output = []
	OS.execute(interpreter_path, ["--version"], output, true)
	print("Python Test Output:", output)
	
	
	if !OS.has_feature("standalone"):
		interpreter_path = ProjectSettings.globalize_path("res://venv/Scripts/python.exe")
		script_path = ProjectSettings.globalize_path("res://islander.py")
	notify("title", "subtitle", "body")
	update_sprites()
	if "height_scale" in menu_params:
		shirtSprite.scale.y = menu_params["height_scale"]
		shirtSprite.position.y = menu_params["shirt_y"]
		pantsSprite.scale.y = menu_params["height_scale"]
		pantsSprite.position.y = menu_params["pants_y"]
		headSprite.position.y = menu_params["head_y"]
		hairSprite.position.y = menu_params["hair_y"]
		eyebrowsSprite.position.y = menu_params["eyebrows_y"]
		eyesSprite.position.y = menu_params["eyes_y"]
		noseSprite.position.y = menu_params["nose_y"]
		mouthSprite.position.y = menu_params["mouth_y"]
	if "width_scale" in menu_params:
		shirtSprite.scale.x = menu_params["width_scale"]
		pantsSprite.scale.x = menu_params["width_scale"]
		
	

func notify(title = "", subtitle = "", body = ""):
	OS.execute(interpreter_path, [script_path, title, subtitle, body])

# Function to update all sprite textures based on menu_params
func update_sprites():
	headSprite.texture = $CompositeSprites.head_spritesheet[menu_params["currHead"]]
	shirtSprite.texture = $CompositeSprites.shirt_spritesheet[menu_params["currShirt"]]
	pantsSprite.texture = $CompositeSprites.pants_spritesheet[menu_params["currPants"]]
	eyebrowsSprite.texture = $CompositeSprites.eyebrows_spritesheet[menu_params["currEyebrows"]]
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[menu_params["currEyes"]]
	hairSprite.texture = $CompositeSprites.hair_spritesheet[menu_params["currHair"]]
	noseSprite.texture = $CompositeSprites.nose_spritesheet[menu_params["currNose"]]
	mouthSprite.texture = $CompositeSprites.mouth_spritesheet[menu_params["currMouth"]]
	
	if "currHead_color" in menu_params:
		headSprite.modulate = menu_params["currHead_color"]
	if "currShirt_color" in menu_params:
		shirtSprite.modulate = menu_params["currShirt_color"]
	if "currMouth_color" in menu_params:
		mouthSprite.modulate = menu_params["currMouth_color"]

# Generic function for setting a sprite index
func set_feature(feature: String, index: int):
	menu_params[feature] = index
	match feature:
		"currHead":
			headSprite.texture = $CompositeSprites.head_spritesheet[index]
		"currShirt":
			shirtSprite.texture = $CompositeSprites.shirt_spritesheet[index]
		"currPants":
			pantsSprite.texture = $CompositeSprites.pants_spritesheet[index]
		"currEyebrows":
			eyebrowsSprite.texture = $CompositeSprites.eyebrows_spritesheet[index]
		"currEyes":
			eyesSprite.texture = $CompositeSprites.eyes_spritesheet[index]
		"currHair":
			hairSprite.texture = $CompositeSprites.hair_spritesheet[index]
		"currNose":
			noseSprite.texture = $CompositeSprites.nose_spritesheet[index]
		"currMouth":
			mouthSprite.texture = $CompositeSprites.mouth_spritesheet[index]


func _on_view_head_pressed():
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	switch_to = "head"
	emit_signal("menu_changed", menu_name)
	

func _on_view_shirt_pressed():
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	switch_to = "shirt"
	emit_signal("menu_changed", menu_name)

func _on_view_eyebrows_pressed():
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	switch_to = "eyebrows"
	emit_signal("menu_changed", menu_name)


func _on_view_eyes_pressed():
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	switch_to = "eyes"
	emit_signal("menu_changed", menu_name)


func _on_view_hair_pressed():
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	switch_to = "hair"
	emit_signal("menu_changed", menu_name)


func _on_view_nose_pressed():
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	switch_to = "nose"
	emit_signal("menu_changed", menu_name)

func _on_view_mouth_pressed():
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	switch_to = "mouth"
	emit_signal("menu_changed", menu_name)

func _on_back_pressed():
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	switch_to = "character"
	emit_signal("menu_changed", menu_name)

func _on_head_selected(index: int):
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	set_feature("currHead", index)


func _on_shirt_selected(index: int):
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	set_feature("currShirt", index)


func _on_eyebrows_selected(index: int):
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	set_feature("currEyebrows", index)


# Eyes selection function (applies to all eye buttons)
func _on_eyes_selected(index: int):
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	set_feature("currEyes", index)


# Hair selection function (applies to all hair buttons)
func _on_hair_selected(index: int):
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	set_feature("currHair", index)


func _on_nose_selected(index: int):
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	set_feature("currNose", index)


func _on_mouth_selected(index: int):
	Sound.play_sfx("res://Music/audio-editor-output (2).mp3")
	set_feature("currMouth", index)



func _on_done_pressed() -> void:
	Sound.play_sfx("res://Music/weee.mp3")
	switch_to = "info_menu"
	emit_signal("menu_changed", menu_name)
	#_play_click_sound()


func _on_name_text_submitted(new_text: String) -> void:
	char_name = new_text
	print(char_name) #test

func _on_name_text_changed(new_text: String) -> void:
	char_name = new_text

func _on_pronouns_item_selected(index: int) -> void:
	if index == 3:
		pass
	char_pronouns = index-1
	if char_pronouns != 2:
		print(pronouns[char_pronouns][0] + "'s beautiful")
	else:
		print(pronouns[char_pronouns][0] + "'re beautiful")
	
	if char_pronouns != 2:
		$Menu/Label.text = pronouns[char_pronouns][0] + "'s beautiful"
	else:
		$Menu/Label.text = pronouns[char_pronouns][0] + "'re beautiful"


func _on_name_focus_entered() -> void:
	$Menu/MarginContainer/VBoxContainer/Name.text = char_name

func _on_name_tree_entered() -> void:
	$Menu/MarginContainer/VBoxContainer/Name.text = char_name

func _on_pronouns_tree_entered() -> void:
	$Menu/MarginContainer/VBoxContainer/Pronouns.selected = char_pronouns+1
	if char_pronouns == 3:
		$Menu/Label.text = "wow cool"
	elif char_pronouns != 2:
		$Menu/Label.text = pronouns[char_pronouns][0] + "'s beautiful"
	else:
		$Menu/Label.text = pronouns[char_pronouns][0] + "'re beautiful"
	
func _on_v_slider_value_changed(value: float) -> void:
	# Scale pants while keeping feet anchored
	var pants_bottom = pantsSprite.position.y + (pantsSprite.texture.get_height() * pantsSprite.scale.y / 2)
	var original_pants_height = pantsSprite.texture.get_height() * pantsSprite.scale.y
	pantsSprite.scale.y = value
	var new_pants_height = pantsSprite.texture.get_height() * pantsSprite.scale.y
	pantsSprite.position.y = pants_bottom - (new_pants_height / 2)  # Keep feet in place

	# Scale shirt from the waist upward
	var original_shirt_height = shirtSprite.texture.get_height() * shirtSprite.scale.y
	shirtSprite.scale.y = value
	var new_shirt_height = shirtSprite.texture.get_height() * shirtSprite.scale.y
	var height_diff = (new_shirt_height - original_shirt_height)  # Shirt grows upwards
	
	shirtSprite.position.y -= height_diff / 2  # Move shirt up

	# Adjust head and facial features to move up
	headSprite.position.y -= height_diff / 2
	hairSprite.position.y -= height_diff / 2
	eyebrowsSprite.position.y -= height_diff / 2
	eyesSprite.position.y -= height_diff / 2
	noseSprite.position.y -= height_diff / 2
	mouthSprite.position.y -= height_diff / 2

	# Save updated values
	menu_params["height_scale"] = shirtSprite.scale.y
	menu_params["shirt_y"] = shirtSprite.position.y
	menu_params["pants_y"] = pantsSprite.position.y
	menu_params["head_y"] = headSprite.position.y
	menu_params["hair_y"] = hairSprite.position.y
	menu_params["eyebrows_y"] = eyebrowsSprite.position.y
	menu_params["eyes_y"] = eyesSprite.position.y
	menu_params["nose_y"] = noseSprite.position.y
	menu_params["mouth_y"] = mouthSprite.position.y



func _on_width_value_changed(value: float) -> void:
	shirtSprite.scale.x = value
	pantsSprite.scale.x = value
	menu_params["width_scale"] = shirtSprite.scale.x


func _on_color_picker_head_color_changed(color: Color) -> void:
	headSprite.modulate = color
	menu_params["currHead_color"] = color

func _on_color_picker_shirt_color_changed(color: Color) -> void:
	shirtSprite.modulate = color
	menu_params["currShirt_color"] = color

func _on_color_picker_mouth_color_changed(color: Color) -> void:
	mouthSprite.modulate = color
	menu_params["currMouth_color"] = color

func _on_done2_pressed() -> void:
	var py_script = ProjectSettings.globalize_path("res://islander.py")
	var json_string = JSON.stringify(menu_params)  # This ensures correct JSON formatting
	var local_path = "user://params.json"
	var file_path = ProjectSettings.globalize_path(local_path)  # Get absolute path
	var file = FileAccess.open(local_path, FileAccess.WRITE)  # Still write to "user://"

	if file:
		file.store_string(json_string)
		file.close()
	else:
		print("failed to open file for writing")
		return
	
	var command = [py_script, char_name, str(char_pronouns), file_path]

	print("executing command: ", command)
	var output = []
	var stderr_output = []
	var exit_code = OS.execute("python", command, output, false) 
	print("STDOUT:\n", output)
	print("STDERR:\n", stderr_output)
	print("Exit code: ", exit_code)

	if output.size() > 0 and exit_code == 0:
		var raw_output = output[0].strip_edges()
		print("raw python output: ", raw_output)
		var json_instance = JSON.new()
		var error_code = json_instance.parse(raw_output)
		
		if error_code == OK:
			var islander_data = json_instance.data
			Global.islanders.append(islander_data)
			
			var demo_map_scene = load("res://demoMap.tscn").instantiate()
			get_tree().root.add_child(demo_map_scene)
			
			if "menu_params" in islander_data and "char_name" in islander_data and "char_pronouns" in islander_data:
				char_pronouns = int(char_pronouns)
				demo_map_scene.load_params(
					islander_data["menu_params"],
					islander_data["char_name"],
					int(islander_data["char_pronouns"])
				)
			else:
				print("missing keys in islander_data: ", islander_data)
		else:
			print("JSON parse error: ", json_instance.get_error_message())
	else:
		print("no output from python script, or script failed")
	#print(Global.islanders.char_name) !!NEXT STEP is to be able to do this
	
