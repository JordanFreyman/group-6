extends Node2D

signal menu_changed(menu_name)

@onready var bodySprite = $CompositeSprites/Body
@onready var eyesSprite = $CompositeSprites/Eyes
@onready var hairSprite = $CompositeSprites/Hair
@onready var noseSprite = $CompositeSprites/Nose
@onready var mouthSprite = $CompositeSprites/Mouth

var menu_params := {
	"currBody": 0,
	"currEyes": 0,
	"currHair": 0,
	"currNose": 0,
	"currMouth": 0
}

@export var menu_name = "menu"
@export var switch_to: String

func load_params(new_menu_params: Dictionary):
	menu_params = new_menu_params

func _ready():
	update_sprites()

# Function to update all sprite textures based on menu_params
func update_sprites():
	bodySprite.texture = $CompositeSprites.body_spritesheet[menu_params["currBody"]]
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[menu_params["currEyes"]]
	hairSprite.texture = $CompositeSprites.hair_spritesheet[menu_params["currHair"]]
	noseSprite.texture = $CompositeSprites.nose_spritesheet[menu_params["currNose"]]
	mouthSprite.texture = $CompositeSprites.mouth_spritesheet[menu_params["currMouth"]]

# Generic function for setting a sprite index
func set_feature(feature: String, index: int):
	menu_params[feature] = index
	match feature:
		"currBody":
			bodySprite.texture = $CompositeSprites.body_spritesheet[index]
		"currEyes":
			eyesSprite.texture = $CompositeSprites.eyes_spritesheet[index]
		"currHair":
			hairSprite.texture = $CompositeSprites.hair_spritesheet[index]
		"currNose":
			noseSprite.texture = $CompositeSprites.nose_spritesheet[index]
		"currMouth":
			mouthSprite.texture = $CompositeSprites.mouth_spritesheet[index]

func _on_view_body_pressed():
	switch_to = "body"
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

func _on_body_selected(index: int):
	set_feature("currBody", index)

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
