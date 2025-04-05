extends Sprite2D

@onready var door_left =$LeftDoor
@onready var door_right = $RightDoor

var door_open = false
var door_speed = 200.0
var door_distance = 100.0
var door_left_closed_pos
var door_right_closed_pos

func _ready():
	door_left_closed_pos = door_left.position
	door_right_closed_pos = door_right.position

func open_doors():
	door_open = true

func _process(delta):
	if door_open:
		# Move doors apart
		if door_left.position.x > door_left_closed_pos.x - door_distance:
			door_left.position.x -= door_speed * delta
		if door_right.position.x < door_right_closed_pos.x + door_distance:
			door_right.position.x += door_speed * delta
