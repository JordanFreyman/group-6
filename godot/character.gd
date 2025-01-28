extends Node2D

@onready var bodySprite = $CompositeSprites/Body
@onready var eyesSprite = $CompositeSprites/Eyes
@onready var hairSprite = $CompositeSprites/Hair
@onready var noseSprite = $CompositeSprites/Nose
@onready var mouthSprite = $CompositeSprites/Mouth

var currBody: int = 0
var currEyes: int = 0
var currHair: int = 0
var currNose: int = 0
var currMouth: int = 0

func _ready():
	bodySprite.texture = $CompositeSprites.body_spritesheet[currBody]
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[currEyes]
	hairSprite.texture = $CompositeSprites.hair_spritesheet[currHair]
	noseSprite.texture = $CompositeSprites.nose_spritesheet[currNose]
	mouthSprite.texture = $CompositeSprites.mouth_spritesheet[currMouth]

func transfer_data_between_scenes(old_scene, new_scene):
	new_scene.currVal = old_scene.currVal
	#create scene object?

func _on_change_eyes_pressed() -> void:
	currEyes = (currEyes + 1) % $CompositeSprites.eyes_spritesheet.size()
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[currEyes]


func _on_view_eyes_pressed() -> void:
	get_tree().change_scene_to_file("res://view_eyes.tscn")


func _on_eyes_1_pressed() -> void:
	currEyes = 0
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[0]


func _on_eyes_2_pressed() -> void:
	currEyes = 1
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[1]


func _on_eyes_3_pressed() -> void:
	currEyes = 2
	eyesSprite.texture = $CompositeSprites.eyes_spritesheet[2]
