extends CharacterBody2D
class_name Player

#nodes
@onready var sprite = $Sprite
@onready var anim = $Anim

#constants
const GRAVITY: float = 1080
const RUN_SPEED: float = 216
const MAX_FALL: float = 660
const HURT_TIME: float = 0.3
const JUMP_FORCE: float = -270

#State Machine
enum PLAYER_STATE {IDLE,RUN,JUMP,FALL,HURT}
var currentState = PLAYER_STATE.IDLE

func _ready():
	pass

func _physics_process(delta):
	if is_on_floor() == false:
		velocity.y += GRAVITY * delta
	
	Inputs()
	move_and_slide()
	CheckState()

func Inputs():
	velocity.x = 0
	if Input.is_action_pressed("left") == true:
		velocity.x = -RUN_SPEED
		sprite.flip_h = true
	elif Input.is_action_pressed("right") == true:
		velocity.x = RUN_SPEED
		sprite.flip_h = false
	if Input.is_action_just_pressed("jump") == true and is_on_floor() == true:
		velocity.y = JUMP_FORCE
		
	velocity.y = clampf(velocity.y, JUMP_FORCE, MAX_FALL)

##STATE MACHINE##
func CheckState():
	if currentState == PLAYER_STATE.HURT:
		return
	
	if is_on_floor() == true:
		if velocity.x == 0:
			ChangeState(PLAYER_STATE.IDLE)
		else:
			ChangeState(PLAYER_STATE.RUN)
	else:
		if velocity.y > 0:
			ChangeState(PLAYER_STATE.FALL)
		else:
			ChangeState(PLAYER_STATE.JUMP)

func ChangeState(newState: PLAYER_STATE):
	if currentState == newState:
		pass
	
	currentState = newState
	
	match currentState:
		PLAYER_STATE.IDLE:
			anim.play("Idle")
		PLAYER_STATE.RUN:
			anim.play("Run")
		PLAYER_STATE.JUMP:
			anim.play("Jump")
		PLAYER_STATE.FALL:
			anim.play("Fall")









