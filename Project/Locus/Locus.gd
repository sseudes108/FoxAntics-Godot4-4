extends Node2D

@onready var playerCam = $PlayerCam
@onready var player = $Player
@onready var parallax = $Parallax


func _ready():
	pass
	#parallax.level = GameManager.currentLevel

func _process(delta):
	playerCam.position = player.position
