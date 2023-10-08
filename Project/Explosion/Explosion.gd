extends AnimatedSprite2D

@onready var sound = $Sound

func _ready():
	SoundManager.PlaySound(sound, SoundManager.ENEMY_EXPLODE)

func AnimationFinished():
	hide()

func SoundFinished():
	queue_free()
