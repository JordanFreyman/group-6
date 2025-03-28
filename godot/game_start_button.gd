extends Button

#if no characters exist already, then open character.tscn to make your first one (with a welcome menu). that will initialize the game, starting it with a "tutorial".
#otherwise, if there ARE currently Character objects existing in the island, switch to demo_map.tscn to play regular game without tutorial.

#character data will be accessed with a mix of JSON and sqlite3, which should be imported from Python scripts containing the game logic. do more research on importing
#Python logic into GDscript.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
func _on_pressed() -> void:
	pass
	 # Replace with function body.
	#when 'start' button pressed, check if game has existing save data. if there is none, redirect player to character.tscn to create their first character and enable tutorial popups.
	#if there IS currently save data that exists, then redirect user to the main map where the gameplay takes place.
