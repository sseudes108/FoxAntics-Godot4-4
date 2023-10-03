extends Area2D

const FRUITS = [
	"Kiwi",
	"Banana",
	"Cherry",
	"Watermelon"
]

@onready var sprite = $AnimatedSprite2D
@onready var timer = $Timer

func _ready():
	var fruit = FRUITS.pick_random()
	sprite.play(fruit)

func _process(delta):
	pass

func OnTimeout():
	queue_free() 
