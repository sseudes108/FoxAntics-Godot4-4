extends Node2D

@onready var playerCam = $PlayerCam
@onready var player = $Player

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	playerCam.position = player.position
