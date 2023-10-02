extends Enemy

@onready var sprite = $AnimatedSprite2D
@onready var rayCast = $RayCast
@onready var directionTimer = $DirectionTimer

const FLY_SPEED: Vector2 = Vector2(35,15)
var flyDir: Vector2 = Vector2(Vector2.ZERO)

func _physics_process(delta):
	super._physics_process(delta)
	velocity = flyDir
	move_and_slide()

func ChangeDirection():
	var xDirection = sign(player.global_position.x - global_position.x)
	if xDirection > 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	
	flyDir = Vector2(xDirection,1) * FLY_SPEED

func ChasePlayer():
	ChangeDirection()
	directionTimer.start()

func ScreenEntered():
	sprite.play("Fly")
	ChasePlayer()

func ScreenExited():
	pass

func OnTimerOut():
	ChasePlayer()
