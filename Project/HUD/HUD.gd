extends Control

@onready var colorScreen = $ColorScreen
@onready var levelComplete = $ColorScreen/LevelComplete
@onready var gameOver = $ColorScreen/GameOver
@onready var heartContainer = $MarginContainer/HBoxContainer/HeartContainer
@onready var sound = $Sound
@onready var pausedBox = $ColorScreen/Paused

@onready var scoreLabel = $MarginContainer/HBoxContainer/Score

var hearts = []

var nextLevel: bool
var mainMenu: bool
var paused: bool

func _ready():
	hearts = heartContainer.get_children()
	nextLevel = false
	mainMenu = false
	SignalManager.LevelComplete.connect(LevelComplete)
	SignalManager.GameOver.connect(GameOver)
	SignalManager.PlayerHit.connect(UpdateHearts)
	SignalManager.PickedUp.connect(UpdateHearts)

func _process(_delta):
	scoreLabel.text = "00%s" %GameManager.score
	
	if Input.is_action_just_pressed("Pause"):
		paused = !paused
	
	if paused:
		ColorScreen()
		pausedBox.show()
		if Input.is_action_just_pressed("jump"):
			GameManager.LoadMainScene()
	else:
		pausedBox.hide()
		if nextLevel == false and mainMenu == false:
			colorScreen.hide()
			Engine.time_scale = 1
			
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
	SoundManager.PlaySound(sound,SoundManager.ENEMY_EXPLODE)
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

func UpdateScore(score):
	scoreLabel.text = "%s" %score
