extends Node2D

const APPEAR: String = "parameters/conditions/IsTrigged"
@onready var stateFlag = $StateFlag
@onready var sprite = $Sprite


func _ready():
	sprite.hide()
	SignalManager.BossKilled.connect(BossDead)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func BossDead():
	sprite.show()
	print("0")
	if stateFlag[APPEAR] == false:
		stateFlag[APPEAR] = true
