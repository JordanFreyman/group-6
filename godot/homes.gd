extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var homes_node = get_parent()
	for i in range(Global.islanders.size()):
		var islander_name = Global.islanders[i]["char_name"]
		var texture_rect = TextureRect.new()
		texture_rect.texture = preload("res://Art/house.png")
		texture_rect.position = Vector2(600 * i, 0)
		homes_node.add_child(texture_rect)

		var name_label = Label.new()
		name_label.text = islander_name
		name_label.label_settings = LabelSettings.new()
		name_label.label_settings.font_size = 60
		name_label.label_settings.font_color = "BLACK"
		name_label.position = Vector2(texture_rect.position.x + 100, texture_rect.position.y + texture_rect.get_rect().size.y - 100)
		homes_node.add_child(name_label)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	var demo_map_scene = load("res://demoMap.tscn").instantiate()
	get_tree().root.add_child(demo_map_scene)
