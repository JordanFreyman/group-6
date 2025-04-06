extends Camera2D

const MOVE_SPEED = 200  
const SMOOTHING_SPEED = 0.000


var min_boundary = Vector2(550, 200) 
var max_boundary = Vector2(1100, 1050)  
var target_position: Vector2

func _ready() -> void:
	target_position = global_position

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		global_position += Vector2.LEFT * delta * MOVE_SPEED
	elif Input.is_action_pressed("ui_right"):
		global_position += Vector2.RIGHT * delta * MOVE_SPEED
	elif Input.is_action_pressed("ui_up"):
		global_position += Vector2.UP * delta * MOVE_SPEED
	elif Input.is_action_pressed("ui_down"):
		global_position += Vector2.DOWN * delta * MOVE_SPEED

	var mouse_pos = get_global_mouse_position()

	target_position = lerp(target_position, mouse_pos, SMOOTHING_SPEED)
	target_position.x = clamp(target_position.x, min_boundary.x, max_boundary.x)
	target_position.y = clamp(target_position.y, min_boundary.y, max_boundary.y)
	global_position = target_position
