extends Node2D


# "Hi [name]!"
# "Hey, (insert choice)"
# correct = +10 points
# wrong = -8 points
var character_name = "Alice"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = "Hello, " + character_name + "!"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
