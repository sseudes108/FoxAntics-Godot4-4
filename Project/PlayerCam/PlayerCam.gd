extends Camera2D

@onready var timer = $Timer

@export var shakeAmount: float = 5

func _ready():
	set_process(false)
	SignalManager.PlayerHit.connect(PlayerHit)

func _process(delta):
	offset = RandomOffSet()

func RandomOffSet() -> Vector2:
	return Vector2(
		randf_range(-shakeAmount,+shakeAmount),
		randf_range(-shakeAmount,+shakeAmount)
	)

func Shake():
	set_process(true)
	timer.start()

func PlayerHit(health: int):
	Shake()

func onTimeout():
	set_process(false)
