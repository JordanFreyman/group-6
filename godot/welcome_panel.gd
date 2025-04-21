extends Panel

@onready var text_label = $Label
@onready var continue_label = $ContinueLabel

var full_text := "WELCOME to THE GAME!!!\nClick around the map to explore!"
var typing_speed := 0.03 # seconds per character
var typing_done := false

func _ready():
	if Global.intro_shown:
		self.visible = false
	else:
		self.visible = true
		text_label.text = ""
		continue_label.visible = false
		start_typewriter(full_text)

func start_typewriter(text):
	typing_done = false
	await type_text(text)
	typing_done = true
	continue_label.visible = true

func type_text(text: String) -> void:
	for i in text.length():
		text_label.text += text[i]
		await get_tree().create_timer(typing_speed).timeout

func _input(event):
	if typing_done and event is InputEventMouseButton and event.pressed:
		hide_panel()

func hide_panel():
	self.visible = false
	text_label.text = ""
	continue_label.visible = false
	typing_done = false
	Global.intro_shown = true
