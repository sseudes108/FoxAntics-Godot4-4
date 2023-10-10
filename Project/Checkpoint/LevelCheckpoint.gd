extends Area2D

@onready var stateFlag = $StateFlag
@onready var sprite = $Sprite
@onready var sound = $Sound

func _ready():
	pass 

func _process(delta):
	pass

func CPTrigged(area):
	SignalManager.LevelComplete.emit()
