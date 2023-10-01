extends Enemy

@onready var sprite = $AnimatedSprite2D

func _ready():
	pass

func _physics_process(delta):
	super._physics_process(delta)
	
	if is_on_floor() == false:
		velocity.y += gravity * delta
	else:
		pass
	
	move_and_slide()

func ChangeDirection():
	sprite.flip_h = !sprite.flip_h
#	floorDetection.position.x = floorDetection.position.x * -1
	
	if facing == FACING.LEFT:
		facing = FACING.RIGHT
	else:
		facing = FACING.LEFT
