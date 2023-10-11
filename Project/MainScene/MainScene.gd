extends CanvasLayer

func _ready():
	Engine.time_scale = 1 

func _process(_delta):
	if Input.is_action_just_pressed("jump"):
		GameManager.LoadNextLevel()
