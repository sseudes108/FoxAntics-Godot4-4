extends Node2D

@onready var sound = $Sound
@onready var timer = $ShootTimer

@export var speed: float = 50
@export var lifeTime: float = 10
@export var delay: float = 0.7
@export var shooter: ObjectManager.SHOOTER

var canShot: bool = true

func _ready():
	timer.wait_time = delay

func Shot(dir: Vector2, point: Vector2):
	if canShot == false:
		return
	
	canShot = false
	
	sound.pitch_scale = randf_range(0.9,1.1)
	SoundManager.PlaySound(sound, SoundManager.LASER)
	
	ObjectManager.Shot(shooter, dir, speed, point)
	timer.start()

func OnTimeout():
	canShot = true
