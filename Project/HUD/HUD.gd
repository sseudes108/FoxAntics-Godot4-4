extends Control

@onready var colorScreen = $ColorScreen
@onready var levelComplete = $ColorScreen/LevelComplete
@onready var gameOver = $ColorScreen/GameOver

func _ready():
	SignalManager.LevelComplete.connect(LevelComplete)
	SignalManager.GameOver.connect(GameOver)

func _process(delta):
	pass

func LevelComplete():
	ColorScreen()
	gameOver.hide()
	levelComplete.show()

func GameOver():
	ColorScreen()
	levelComplete.hide()
	gameOver.show()

func ColorScreen():
	colorScreen.show()
	Engine.time_scale = 0
