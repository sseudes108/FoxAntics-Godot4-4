extends CharacterBody2D
class_name Player

#sprite
@onready var sprite = $Sprite
@onready var anim = $Anim

#invencible
@onready var invencibleAnim = $InvencibleAnim
@onready var invencibleTimer = $InvencibleTimer

#shot
@onready var shooter = $Shooter
@onready var pointR = $FirePointR
@onready var pointL = $FirePointL

@onready var hurtTimer = $HurtTimer

#sound
@onready var sound = $Sound
@onready var jumpSound = $Sound/JumpSound

#debug
@onready var debugLabel = $DebugLabel

#constants
const GRAVITY: float = 1080
const RUN_SPEED: float = 420
const MAX_FALL: float = 660
const JUMP_FORCE: float = -270
const HURT_JUMP_FORCE: float = -172

var canDoubleJump: bool = false
var invencible: bool = false

var health: int = 5
var coyote: float = 0.2

#State Machine
enum PLAYER_STATE {IDLE,RUN,JUMP,FALL,HURT}
var currentState = PLAYER_STATE.IDLE

func _ready():
	pass

func _physics_process(delta):
	if is_on_floor() == false:
		velocity.y += GRAVITY * delta
	
	if is_on_floor() == false:
		coyote -= delta
	else:
		coyote = 0.2
	
	Inputs()
	move_and_slide()
	CheckState()
	UpdateDebugLabel()

func UpdateDebugLabel():
	debugLabel.text = "Grounded: %s\nHP:%s\n%s\n%s/%s" % [
		is_on_floor(),
		health,
		PLAYER_STATE.keys()[currentState],
		velocity.x, velocity.y
		]

func Inputs():
	velocity.x = 0
	
	#no Input
	if (currentState == PLAYER_STATE.HURT or Engine.time_scale == 0):
		return
	
	#Move
	if Input.is_action_pressed("left") == true:
		velocity.x = -RUN_SPEED
		sprite.flip_h = true
	elif Input.is_action_pressed("right") == true:
		velocity.x = RUN_SPEED
		sprite.flip_h = false
	
	#Jump
	if Input.is_action_just_pressed("jump") == true:
		if (is_on_floor() == true or coyote > 0):
			Jump()
			canDoubleJump = true
	
	if canDoubleJump == true:
		if Input.is_action_just_pressed("jump") == true and is_on_floor() == false:
			Jump()
			canDoubleJump = false
	
	velocity.y = clampf(velocity.y, JUMP_FORCE, MAX_FALL)
	
	#Shot
	if Input.is_action_just_pressed("shoot") == true:
		var dir: Vector2
		var firePoint: Vector2
		
		if sprite.flip_h == true:
			dir = Vector2.LEFT
			firePoint = pointL.global_position
		else:
			dir = Vector2.RIGHT
			firePoint = pointR.global_position
		
		shooter.Shot(dir, firePoint)

func Jump():
	jumpSound.pitch_scale = randf_range(0.9,1.1)
	SoundManager.PlaySound(jumpSound, SoundManager.JUMP)
	velocity.y = JUMP_FORCE

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
	
	if currentState == PLAYER_STATE.FALL:
		if newState == PLAYER_STATE.IDLE or newState == PLAYER_STATE.RUN:
			sound.pitch_scale = randf_range(0.9,1.1)
			SoundManager.PlaySound(sound, SoundManager.LAND)
	
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
		PLAYER_STATE.HURT:
			anim.play("Hurt")
			Hurt()

#Collisions
func HitBoxEntered(area):
	print("Player Hit " , area)
	TakeHit()

func TakeHit():
	if invencible == true:
		return
	else:
		health -= 1
		SignalManager.PlayerHit.emit(health)
		
		if health <= 0:
			SignalManager.GameOver.emit()
		
		InvencibleStart()
		SoundManager.PlaySound(sound,SoundManager.DAMAGE)
		ChangeState(PLAYER_STATE.HURT)

func Hurt():
	velocity.y = HURT_JUMP_FORCE
	hurtTimer.start()

func HurtTimeOver():
	ChangeState(PLAYER_STATE.IDLE)

func InvencibleStart():
	invencible = true
	invencibleTimer.start()
	invencibleAnim.play("Invencible")

func InvencibleEnd():
	invencible = false
	invencibleAnim.stop()
