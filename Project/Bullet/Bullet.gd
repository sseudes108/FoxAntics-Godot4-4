extends Area2D
class_name Bullet

var direction: Vector2 = Vector2.RIGHT
var lifeTime: float = 0

func _ready():
	pass

func _process(delta):
	lifeTime += delta
	if lifeTime > 20:
		Destroy()
	
	position += direction * delta

func SetUp(dir: Vector2, speed: float):
	direction = dir.normalized() * speed

func Destroy():
	queue_free()
