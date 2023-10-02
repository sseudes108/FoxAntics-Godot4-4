extends Enemy

@onready var sprite = $AnimatedSprite2D
@onready var jumpTimer = $JumpTimer

const JUMPFORCE: Vector2 = Vector2(100,-172)
const JUMPWAIT: Vector2 = Vector2(2.7,5.4)

var jump: bool = false
var playerSeen: bool = false

func _ready():
	super._ready()
	StartTimer()

func _physics_process(delta):
	super._physics_process(delta)
	
	if is_on_floor() == false:
		velocity.y += gravity * delta
	else:
		velocity.x = 0
		sprite.play("Idle")
	
	Jump()
	move_and_slide()
	ChangeDirection()

func Jump():
	if is_on_floor() == false or playerSeen == false or jump == false:
		return
	
	velocity = JUMPFORCE
	
	if sprite.flip_h == false:
		velocity.x = velocity.x * -1
	
	jump = false
	
	sprite.play("Jump")
	StartTimer()

func ChangeDirection():
	if (player.global_position.x > global_position.x and sprite.flip_h == false):
		sprite.flip_h = true
	elif (player.global_position.x < global_position.x and sprite.flip_h == true):
		sprite.flip_h = false

func ScreenEntered():
	playerSeen = true

func ScreenExited():
	playerSeen = false

func StartTimer():
	jumpTimer.wait_time = randf_range(JUMPWAIT.x,JUMPWAIT.y)
	jumpTimer.start()

func JumpTimeout():
	jump = true
