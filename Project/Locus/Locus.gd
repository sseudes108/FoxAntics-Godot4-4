extends Node2D

@onready var playerCam = $PlayerCam
@onready var player = $Player
@onready var parallax = $Parallax


func _ready():
	Engine.time_scale = 1

func _process(delta):
	playerCam.position = player.position
