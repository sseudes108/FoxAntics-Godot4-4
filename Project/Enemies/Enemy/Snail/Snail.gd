extends Enemy

@onready var sprite = $AnimatedSprite2D
@onready var floorDetection = $FloorDetection

func _ready():
	pass

func _physics_process(delta):
	super._physics_process(delta)
	
	if is_on_floor() == false:
		velocity.y += gravity * delta
	else:
		velocity.x = speed * facing
	
	move_and_slide()
	
	if is_on_floor() == true:
		if is_on_wall() == true or floorDetection.is_colliding() == false:
			ChangeDirection()

func ChangeDirection():
	sprite.flip_h = !sprite.flip_h
	floorDetection.position.x = floorDetection.position.x * -1
	
	if facing == FACING.LEFT:
		facing = FACING.RIGHT
	else:
		facing = FACING.LEFT
