extends CanvasLayer

func _ready():
	Engine.time_scale = 1 

func _process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		GameManager.LoadNextLevel()
