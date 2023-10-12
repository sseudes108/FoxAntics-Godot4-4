extends CanvasLayer

@onready var highScore = $VBoxContainer/Label2

func _ready():
	Engine.time_scale = 1
	highScore.text = "highScore: 00%s" % GameManager.score

func _process(_delta):
	if Input.is_action_just_pressed("jump"):
		GameManager.LoadNextLevel()
		GameManager.score = 0
