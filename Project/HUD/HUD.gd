extends Control

@onready var colorScreen = $ColorScreen
@onready var levelComplete = $ColorScreen/LevelComplete
@onready var gameOver = $ColorScreen/GameOver
@onready var heartContainer = $MarginContainer/HBoxContainer/HeartContainer

var hearts = []

var nextLevel: bool
var mainMenu: bool

func _ready():
	hearts = heartContainer.get_children()
	nextLevel = false
	mainMenu = false
	SignalManager.LevelComplete.connect(LevelComplete)
	SignalManager.GameOver.connect(GameOver)
	SignalManager.PlayerHit.connect(UpdateHearts)

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		if nextLevel == true:
			GameManager.LoadNextLevel()
		if mainMenu == true:
			GameManager.LoadMainScene()

func LevelComplete():
	nextLevel = true
	mainMenu = false
	ColorScreen()
	gameOver.hide()
	levelComplete.show()

func GameOver():
	mainMenu = true
	nextLevel = false
	ColorScreen()
	levelComplete.hide()
	gameOver.show()

func ColorScreen():
	colorScreen.show()
	Engine.time_scale = 0

func UpdateHearts(playerHealth: int):
	for i in range(hearts.size()):
		hearts[i].visible = i < playerHealth
