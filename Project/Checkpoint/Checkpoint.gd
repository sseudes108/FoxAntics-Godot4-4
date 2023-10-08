extends Node2D

const APPEAR: String = "parameters/conditions/IsTrigged"
@onready var stateFlag = $StateFlag
@onready var sprite = $Sprite


func _ready():
	sprite.hide()
	SignalManager.BossKilled.connect(BossDead)

func _process(delta):
	pass

func BossDead():
	sprite.show()
	if stateFlag[APPEAR] == false:
		stateFlag[APPEAR] = true

func CPTrigger(area):
	print("0")
