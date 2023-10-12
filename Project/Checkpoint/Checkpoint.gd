extends Node2D

const APPEAR: String = "parameters/conditions/IsTrigged"

@onready var stateFlag = $StateFlag
@onready var sprite = $Sprite
@onready var sound = $Sound

func _ready():
	sprite.hide()
	SignalManager.BossKilled.connect(BossDead)

func BossDead(points):
	sprite.show()
	if stateFlag[APPEAR] == false:
		stateFlag[APPEAR] = true
		SignalManager.BossKilled.emit(points)

func CPTrigger(_area):
	if stateFlag[APPEAR] == true:
		SoundManager.PlaySound(sound, SoundManager.WIN)

