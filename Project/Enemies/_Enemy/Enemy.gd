extends CharacterBody2D
class_name Enemy

var OFFSCREEN: float = 720
enum FACING { LEFT = -1, RIGHT = 1 }

@export var defaultFacing: FACING = FACING.LEFT
@export var points: int = 1

@export var speed: float = 33
var gravity: float = 800
var facing: FACING = defaultFacing
var player: Player
var die: bool = false

func _ready():
	player = get_tree().get_nodes_in_group(GameManager.GROUP_PLAYER)[0]

func _physics_process(delta):
	OffScreen()

func OffScreen():
	if global_position.y > OFFSCREEN:
		queue_free()

func Die():
	if die == true:
		return
	
	die = true
	SignalManager.EnemyHit.emit(points, global_position)
	ObjectManager.EnemyExplosion(global_position)
	ObjectManager.PickUp(global_position)
	set_physics_process(false)
	hide()
	queue_free()

func ScreenEntered():
	pass

func ScreenExited():
	pass

func HitBoxEntered(area):
	Die()
