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

func load_params(new_menu_params: Dictionary):
	menu_params = new_menu_params

func _ready():
	bodySprite.texture = $CompositeSprites.body_spritesheet[menu_params["currBody"]]
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[menu_params["currEyes"]]
	hairSprite.texture = $CompositeSprites.hair_spritesheet[menu_params["currHair"]]
	noseSprite.texture = $CompositeSprites.nose_spritesheet[menu_params["currNose"]]
	mouthSprite.texture = $CompositeSprites.mouth_spritesheet[menu_params["currMouth"]]


func _on_view_eyes_pressed() -> void:
	#get_tree().change_scene_to_file("res://view_eyes.tscn")
	emit_signal("menu_changed", menu_name)


func _on_eyes_1_pressed() -> void:
	menu_params["currEyes"] = 0
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[0]


func _on_eyes_2_pressed() -> void:
	menu_params["currEyes"] = 1
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[1]


func _on_eyes_3_pressed() -> void:
	menu_params["currEyes"] = 2
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[2]


func _on_back_pressed() -> void:
	emit_signal("menu_changed", menu_name)
