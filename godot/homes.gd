extends Node2D
@export var switch_to: String
@export var menu_name = "homes"
signal menu_changed(menu_name)
var menu_params = {}
var char_name = ""
var char_pronouns = 0
var house_num = 0

# Called when the node enters the scene tree for the first time.
func load_params(new_menu_params: Dictionary, new_char_name: String, new_char_pronouns: int, new_house_num: int):
	# Not needed right now, but defined for scene_manager.gd compatibility
	menu_params = new_menu_params
	char_name = new_char_name
	char_pronouns = new_char_pronouns
	house_num = new_house_num

func _ready() -> void:
	for i in range(Global.islanders.size()):
		var islander_name = Global.islanders[i]["char_name"]
		var texture_rect = TextureRect.new()
		var house_number = Global.islanders[i]["house_num"]
		texture_rect.texture = load("res://Art/house" + str(house_number) + ".png")
		texture_rect.position = Vector2(600 * i, 0)
		add_child(texture_rect)

		var name_label = Label.new()
		name_label.text = islander_name
		name_label.label_settings = LabelSettings.new()
		name_label.label_settings.font_size = 60
		name_label.label_settings.font_color = "BLACK"
		name_label.position = Vector2(texture_rect.position.x + 100, texture_rect.position.y + texture_rect.get_rect().size.y)
		add_child(name_label)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	switch_to = "demoMap"  # or "character", or whatever scene name you want
	emit_signal("menu_changed", menu_name)
