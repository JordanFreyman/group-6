extends Node
var next_menu = null

@onready var current_menu = $Character

func _ready() -> void:
	current_menu.connect("menu_changed", handle_menu_changed)

func handle_menu_changed(current_menu_name: String):
	var next_menu_name : String
	match current_menu_name:
		"character":
			next_menu_name = "eyes"
		"eyes":
			next_menu_name = "character"
		_:
			return
			
	var temp = load("res://"+next_menu_name+".tscn")
	next_menu = temp.instantiate()
	call_deferred("add_child",next_menu)
	next_menu.connect("menu_changed", handle_menu_changed)
	current_menu.queue_free()
	current_menu = next_menu
	next_menu = null
