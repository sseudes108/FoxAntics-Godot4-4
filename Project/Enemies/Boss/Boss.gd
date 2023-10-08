extends Node2D

const HIT: String = "parameters/conditions/OnHit"
const TRIGGER: String = "parameters/conditions/OnTrigger"

@onready var stateMachine = $StateMachine
@onready var body = $Body
@onready var sound = $Sound

@export var health: int = 1
@export var points: int = 5

var player: Player

var invencible: bool = false

func _ready():
	pass

func _process(delta):
	pass

func Trigger(area):
	if stateMachine[TRIGGER] == false:
		stateMachine[TRIGGER] = true

func Hit(area):
	if stateMachine[TRIGGER] == true:
		TakeHit()
	else:
		return

func HitTween():
	var tween = get_tree().create_tween()
	tween.tween_property(body, "position", Vector2.ZERO, 1.0)

func Invencible(key: bool):
	invencible = key
	stateMachine[HIT] = key

func Health():
	health -= 1
	SoundManager.PlaySound(sound, SoundManager.BOSS_HIT)
	if health <= 0:
		SignalManager.BossKilled.emit()
		set_process(false)
		queue_free()
		SoundManager.PlaySound(sound, SoundManager.ENEMY_EXPLODE)
		ObjectManager.EnemyExplosion(global_position)
	print(health)

func TakeHit():
	if invencible == true:
		return
	
	Invencible(true)
	HitTween()
	Health()

#func ChangeDirection():
#	var xDirection = sign(player.global_position.x - global_position.x)
#	if xDirection > 0:
#		body.scale.x = (scale.x *= -1)
#	else:
#		body#
