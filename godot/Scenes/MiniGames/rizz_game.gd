extends Node2D

var AreYouLines = [
	# Good
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	# Bad
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	# Awful
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"},
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type":"good"}
]

var DoYouLines = [
	# Good
	{"choice": "", "line": "Do you ? Because !", "type":"good"},
	{"choice": "", "line": "Do you? Because !", "type":"good"},
	{"choice": "", "line": "Do you ? Because !", "type":"good"},
	{"choice": "", "line": "Do you? Because !", "type":"good"},
	{"choice": "", "line": "Do you ? Because !", "type":"good"},
	{"choice": "", "line": "Do you? Because !", "type":"good"},
	{"choice": "", "line": "Do you ? Because !", "type":"good"},
	{"choice": "", "line": "Do you? Because !", "type":"good"},
	# Bad
	{"choice": "", "line": "Do you ? Because !", "type":"bad"},
	{"choice": "", "line": "Do you? Because !", "type":"bad"},
	{"choice": "", "line": "Do you ? Because !", "type":"bad"},
	{"choice": "", "line": "Do you? Because !", "type":"bad"},
	{"choice": "", "line": "Do you ? Because !", "type":"bad"},
	{"choice": "", "line": "Do you? Because !", "type":"bad"},
	{"choice": "", "line": "Do you ? Because !", "type":"bad"},
	{"choice": "", "line": "Do you? Because !", "type":"bad"},
	# Awful
{"choice": "", "line": "Do you ? Because !", "type":"awful"},
	{"choice": "", "line": "Do you? Because !", "type":"awful"},
	{"choice": "", "line": "Do you ? Because !", "type":"awful"},
	{"choice": "", "line": "Do you? Because !", "type":"awful"},
	{"choice": "", "line": "Do you ? Because !", "type":"awful"},
	{"choice": "", "line": "Do you? Because !", "type":"awful"},
	{"choice": "", "line": "Do you ? Because !", "type":"awful"},
	{"choice": "", "line": "Do you? Because !", "type":"awful"}
]



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var randomType = randi() % 2
	var phrase = "uhhhhh..."
	if(randomType == 0):
		phrase = "Are you a ..."
		var choice1 = AreYouLines[randi() % AreYouLines.size()]
		var choice2 = AreYouLines[randi() % AreYouLines.size()]
		var choice3 = AreYouLines[randi() % AreYouLines.size()]
	elif(randomType == 1):
		phrase = "Do you ..."
		var choice1 = AreYouLines[randi() % DoYouLines.size()]
		var choice2 = AreYouLines[randi() % DoYouLines.size()]
		var choice3 = AreYouLines[randi() % DoYouLines.size()]
	$Label2.text = phrase
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
