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

func _ready():
	sprite.play(FRUITS.pick_random())

func _process(delta):
	pass

func Destroy():
	queue_free() 

func Pick(area):
	print("PickUp Collected")
	SignalManager.pickedUp.emit(POINTS)
	Destroy()
