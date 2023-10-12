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

func Destroy():
	queue_free() 

func Pick(_area):
	if (sprite.animation == "Banana"):
		if player.health < 5:
			player.health += 1
			SignalManager.PickedUp.emit(player.health)
		else:
			pass
	
	SoundManager.PlaySound(player.sound,SoundManager.PICKUP)
	SignalManager.EnemyHit.emit(POINTS, global_position)
	Destroy()
