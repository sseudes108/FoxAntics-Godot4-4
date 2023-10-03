extends AnimatedSprite2D

func AnimationFinished():
	hide()
	
func SoundFinished():
	queue_free()
