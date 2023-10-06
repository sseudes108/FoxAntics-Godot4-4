extends Node2D

const HIT: String = "parameters/conditions/OnHit"
const TRIGGER: String = "parameters/conditions/OnTrigger"

@onready var stateMachine = $StateMachine
@onready var body = $Body

@export var health: int = 2
@export var points: int = 5

var invencible: bool = false

func _ready():
	pass

func _process(delta):
	pass

func Trigger(area):
	if stateMachine[TRIGGER] == false:
		stateMachine[TRIGGER] = true

func Hit(area):
	TakeHit()

func HitTween():
	var tween = get_tree().create_tween()
	tween.tween_property(body, "position", Vector2.ZERO, 1.0)

func Invencible(key: bool):
	print("Invencible: ", key)
	invencible = key
	stateMachine[HIT] = key

func Health():
	health -= 1
	if health <= 0:
		SignalManager.BossKilled.emit(points)
		set_process(false)
		queue_free()
	print(health)

func TakeHit():
	if invencible == true:
		return
		
	Invencible(true)
	HitTween()
	Health()
