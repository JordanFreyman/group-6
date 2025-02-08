extends Node2D

signal menu_changed(menu_name)

@onready var headSprite = $CompositeSprites/Head
@onready var bodySprite = $CompositeSprites/Body
@onready var eyebrowsSprite = $CompositeSprites/Eyebrows
@onready var eyesSprite = $CompositeSprites/Eyes
@onready var hairSprite = $CompositeSprites/Hair
@onready var noseSprite = $CompositeSprites/Nose
@onready var mouthSprite = $CompositeSprites/Mouth

var menu_params := {
	"currHead": 0,
	"currBody": 0,
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
	update_sprites()
	var slider_vals = {
		"hairHeight": $CompositeSprites/Hair.global_position.y
	}

# Function to update all sprite textures based on menu_params
func update_sprites():
	headSprite.texture = $CompositeSprites.head_spritesheet[menu_params["currHead"]]
	bodySprite.texture = $CompositeSprites.body_spritesheet[menu_params["currBody"]]
	eyebrowsSprite.texture = $CompositeSprites.eyebrows_spritesheet[menu_params["currEyebrows"]]
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[menu_params["currEyes"]]
	hairSprite.texture = $CompositeSprites.hair_spritesheet[menu_params["currHair"]]
	noseSprite.texture = $CompositeSprites.nose_spritesheet[menu_params["currNose"]]
	mouthSprite.texture = $CompositeSprites.mouth_spritesheet[menu_params["currMouth"]]

# Generic function for setting a sprite index
func set_feature(feature: String, index: int):
	menu_params[feature] = index
	match feature:
		"currHead":
			headSprite.texture = $CompositeSprites.head_spritesheet[index]
		"currBody":
			bodySprite.texture = $CompositeSprites.body_spritesheet[index]
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
	switch_to = "head"
	emit_signal("menu_changed", menu_name)

func _on_view_body_pressed():
	switch_to = "body"
	emit_signal("menu_changed", menu_name)

func _on_view_eyebrows_pressed():
	switch_to = "eyebrows"
	emit_signal("menu_changed", menu_name)

func _on_view_eyes_pressed():
	switch_to = "eyes"
	emit_signal("menu_changed", menu_name)

func _on_view_hair_pressed():
	switch_to = "hair"
	emit_signal("menu_changed", menu_name)

func _on_view_nose_pressed():
	switch_to = "nose"
	emit_signal("menu_changed", menu_name)

func _on_view_mouth_pressed():
	switch_to = "mouth"
	emit_signal("menu_changed", menu_name)

func _on_back_pressed():
	switch_to = "character"
	emit_signal("menu_changed", menu_name)

func _on_head_selected(index: int):
	set_feature("currHead", index)

func _on_body_selected(index: int):
	set_feature("currBody", index)

func _on_eyebrows_selected(index: int):
	set_feature("currEyebrows", index)

# Eyes selection function (applies to all eye buttons)
func _on_eyes_selected(index: int):
	set_feature("currEyes", index)

# Hair selection function (applies to all hair buttons)
func _on_hair_selected(index: int):
	set_feature("currHair", index)

func _on_nose_selected(index: int):
	set_feature("currNose", index)

func _on_mouth_selected(index: int):
	set_feature("currMouth", index)


func _on_done_pressed() -> void:
	switch_to = "info_menu"
	emit_signal("menu_changed", menu_name)


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

var drag_started = 0

func _on_h_slider_drag_ended(value_changed: bool) -> void:
	var val = $HSlider.value
	hairSprite.global_position.y += val - drag_started

func _on_h_slider_drag_started() -> void:
	drag_started = $HSlider.value

#height slider
func _on_v_slider_drag_started() -> void:
	var val = $VSlider.value
	print(val)
	print(val - drag_started)
	bodySprite.scale.y = val

#height slider
func _on_v_slider_drag_ended(value_changed: bool) -> void:
	drag_started = $VSlider.value
