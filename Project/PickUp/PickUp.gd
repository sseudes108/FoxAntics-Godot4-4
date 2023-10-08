extends Area2D

const FRUITS = [
	"Kiwi",
	"Banana",
	"Cherry",
	"Watermelon"
]

const POINTS: int = 2

@onready var sprite = $AnimatedSprite2D
@onready var timer = $Timer

var player: Player

func _ready():
	sprite.play(FRUITS.pick_random())
	player = get_tree().get_nodes_in_group(GameManager.GROUP_PLAYER)[0]

func _process(delta):
	pass

func Destroy():
	queue_free() 

func Pick(area):
	SoundManager.PlaySound(player.sound,SoundManager.PICKUP)
	SignalManager.pickedUp.emit(POINTS)
	Destroy()
