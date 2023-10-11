extends Area2D

@onready var stateFlag = $StateFlag
@onready var sprite = $Sprite
@onready var sound = $Sound

func CPTrigged(_area):
	SignalManager.LevelComplete.emit()
