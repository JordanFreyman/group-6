extends TextureButton


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scene_3.tscn")
