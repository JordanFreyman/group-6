extends Node2D

var menu_params: Dictionary = {}
var char_name: String = "[empty name]"
var char_pronouns: int = 0
@export var menu_name = "menu"
@export var switch_to: String
signal menu_changed(menu_name)

func load_params(new_menu_params: Dictionary, new_char_name: String, new_char_pronouns: int):
	menu_params = new_menu_params
	char_name = new_char_name
	char_pronouns = new_char_pronouns



var AreYouLines = [
	# Good
	{"choice": "toaster", "line": "Are you a toaster? Because you are hot!", "type": "good"},
	{"choice": "falling star", "line": "Are you a falling star? Because I feel like I’ve been wishing for you all my life.", "type": "good"},
	{"choice": "map", "line": "Are you a map? Because I’m lost in your eyes.", "type": "good"},
	{"choice": "sun", "line": "Are you the sun? Because you make everything feel brighter and warmer.", "type": "good"},
	{"choice": "peacock", "line": "Are you a peacock? Because every time you walk in, the room feels so much more colorful.", "type": "good"},
	{"choice": "butterfly", "line": "Are you a butterfly? Because I feel like my heart is fluttering every time you’re near.", "type": "good"},
	{"choice": "star", "line": "Are you a star? Because you make my world shine brighter even on the darkest nights.", "type": "good"},
	
	# Bad
	{"choice": "potato", "line": "Are you a potato? Because you’re kind of mashed up in my head.", "type": "bad"},
	{"choice": "dog", "line": "Are you a dog? Because I’m here for the treats.", "type": "bad"},
	{"choice": "pencil", "line": "Are you a pencil? Because I’ve got no idea what to write about you.", "type": "bad"},
	{"choice": "ice cream", "line": "Are you ice cream? Because, I like to lick you?", "type": "bad"},
	{"choice": "cup of coffee", "line": "Are you a cup of coffee? Because I really don’t care about how you taste.", "type": "bad"},
	{"choice": "lamp", "line": "Are you a lamp? Because I don’t really think you’re giving me any light.", "type": "bad"},
	{"choice": "sock", "line": "Are you a sock? Because I’m honestly not sure what you’re doing here.", "type": "bad"},
	{"choice": "Mii", "line": "Are you a Mii? Because your face is definitely lacking some dimension.", "type": "bad"},
	{"choice": "Tomodachi", "line": "Are you a Tomodachi? Because every time we talk, it feels like a random NPC interaction.", "type": "bad"},
	
	# Awful
	{"choice": "toaster", "line": "Are you a toaster? Because I want to get stuck in your slots and never come out…", "type": "awful"},
	{"choice": "rotten apple", "line": "Are you a rotten apple? Because you’ve got me feeling all bruised and mushy inside.", "type": "awful"},
	{"choice": "cow", "line": "Are you a cow? Because I’d love to milk you for all the compliments you never give me.", "type": "awful"},
	{"choice": "banana peel", "line": "Are you a banana peel? Because I feel like I’m about to slip and fall for you.", "type": "awful"},
	{"choice": "wet towel", "line": "Are you a wet towel? Because I want to hang out with you.", "type": "awful"},
	{"choice": "spider", "line": "Are you a spider? Because all you are good for is cobwebs.", "type": "awful"},
	{"choice": "potato", "line": "Are you a potato? Because I’d like to peel your skin.", "type": "awful"},
	{"choice": "Mii", "line": "Are you a Mii? Because I love to drag you around and watch you run.", "type": "awful"},
	{"choice": "Tomodachi", "line": "Are you a Tomodachi Life character? Because talking to you feels like listening to a random islander ramble on about their weird dreams.", "type": "awful"}
];

var DoYouLines = [
	# Good
	{"choice": "have a love potion", "line": "Do you have a love potion? Because I feel like I’m falling for you every time you look at me.", "type": "good"},
	{"choice": "have a star", "line": "Do you have a star? Because every time I see you, it feels like I’m looking at the most beautiful constellation.", "type": "good"},
	{"choice": "have wings", "line": "Do you have wings? Because you make my world feel like it’s flying.", "type": "good"},
	{"choice": "have a garden", "line": "Do you have a garden? Because talking to you is like watching flowers bloom.", "type": "good"},
	{"choice": "have a map", "line": "Do you have a map? Because I’m lost in your eyes, and I don’t ever want to be found.", "type": "good"},
	{"choice": "know how to make magic", "line": "Do you know how to make magic? Because you’ve just made my heart feel like it’s soaring.", "type": "good"},
	{"choice": "have a pet", "line": "Do you have a pet? Because if not, I'd like to apply for the role.", "type": "good"},
	
	# Bad
	{"choice": "like coffee", "line": "Do you like coffee? Because I’m just here for the caffeine, not for any actual conversation.", "type": "bad"},
	{"choice": "like silence", "line": "Do you like silence? Because I think this conversation could use a little more of that.", "type": "bad"},
	{"choice": "like regular soda", "line": "Do you like diet soda? Because you’re the blandest thing I’ve ever had.", "type": "bad"},
	{"choice": "like clouds", "line": "Do you like clouds? Because I don’t see you bringing anything else but rain.", "type": "bad"},
	{"choice": "like old shoes", "line": "Do you like old shoes? Because I’m starting to think we’ve both got holes in us.", "type": "bad"},
	{"choice": "like cats", "line": "Do you like cats? Because that’s cool... but not as cool as being honest about our awkwardness.", "type": "bad"},
	{"choice": "like pizza", "line": "Do you like pizza? Because it’s okay... just like this conversation.", "type": "bad"},
	{"choice": "like Tomodachi Life", "line": "Do you like Tomodachi Life? Because talking to you is so predictable.", "type": "bad"},
	
	# Awful
	{"choice": "have a magic wand", "line": "Do you have a magic wand? Because it’s the only way anyone will ever love you.", "type": "awful"},
	{"choice": "know how to make love potions", "line": "Do you know how to make love potions? Because I think you’re the only one who could get me to *ever* like you.", "type": "awful"},
	{"choice": "like rotten eggs", "line": "Do you like rotten eggs? Because that’s how I feel every time you speak to me.", "type": "awful"},
	{"choice": "eat spoiled milk", "line": "Do you eat spoiled milk? Because talking to you makes me feel like I’m about to lose my lunch.", "type": "awful"},
	{"choice": "know how to catch rats", "line": "Do you know how to catch rats? Because that’s how I feel every time I’m stuck in this conversation.", "type": "awful"},
	{"choice": "have a pet snake", "line": "Do you have a pet snake? Because talking to you feels like I’m about to get bit.", "type": "awful"},
	{"choice": "make sourdough", "line": "Do you like moldy bread? Because together we could make sourdough, but I’m not sure I even want to.", "type": "awful"},
	{"choice": "know how to make a Mii", "line": "Do you know how to make a Mii? Because you should make yourself a new character design.", "type": "awful"},
	{"choice": "play video games", "line": "Do you play video games? Because thats all I'll want to do when you are around.", "type": "awful"}
];

var current_choices: Array  # Stores the 3 random choices for this menu
var selected_choice: Dictionary
var character_social_points = 34

func _ready() -> void:
	
	characterLabels()
	
	
	var randomType = randi() % 2
	var popup = $MenuButton.get_popup()
	popup.clear()  # Clear previous items

	# Generate 3 random choices from appropriate array
	current_choices = []
	var source_array = AreYouLines if randomType == 0 else DoYouLines
	for x in 3:
		current_choices.append(source_array[randi() % source_array.size()])

	# Set menu text and populate items
	$MenuButton.text = "Are you a..." if randomType == 0 else "Do you..."
	for choice in current_choices:
		popup.add_item(choice["choice"])
	# Connect signal directly to handler
	popup.id_pressed.connect(_on_menu_item_selected)

func hide_menu():
	$MenuButton.get_popup().hide()
	$MenuButton.get_popup().clear()

func _on_menu_item_selected(index: int):
	selected_choice = current_choices[index]
	$MenuButton.text = selected_choice["line"]
	var type = selected_choice["type"]
	if(type == "good"):
		character_social_points += 10
	elif(type == "bad"):
		character_social_points += 1
	else:
		character_social_points -= 8
	$Label2.text = "RelationshipPoints: " + str(character_social_points)
	hide_menu()

func characterLabels():
	$Label2.text = "RelationshipPoints: " + str(character_social_points)
	$Label3.text = char_name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_return_pressed() -> void:
	$Label3.text = "HELLLLPPPPPPP"
	# Change scene
	get_tree().change_scene_to_file("res://demoMap.tscn")
