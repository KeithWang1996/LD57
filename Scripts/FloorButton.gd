extends Area2D

@onready var sprite = $ButtonTexture

@export var elevator_node: NodePath
var elevator

# Frame setup (using a spritesheet)
var default_region = Rect2(0, 0, 64, 32)
var pushed_region = Rect2(0, 32, 64, 32)

func _ready():
	# Set default sprite region
	var atlas := sprite.texture as AtlasTexture
	atlas.region = default_region
	sprite.texture = atlas
	elevator = get_node(elevator_node)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			_on_button_pressed()

func _on_button_pressed():
	# Change sprite to pushed
	var atlas = sprite.texture as AtlasTexture
	atlas.region = pushed_region
	sprite.texture = atlas
	elevator.open_doors()
	# Add logic: open door, trigger animation, etc.
