extends Camera2D

@onready var timer = $Timer

@export var shakeAmount: float = 5

func _ready():
	set_process(false)
	SignalManager.PlayerHit.connect(PlayerHit)
	SignalManager.GameOver.connect(onTimeout)

func _process(_delta):
	offset = RandomOffSet()

func RandomOffSet() -> Vector2:
	return Vector2(
		randf_range(-shakeAmount,+shakeAmount),
		randf_range(-shakeAmount,+shakeAmount)
	)

func Shake():
	set_process(true)
	timer.start()

func PlayerHit(_health):
	Shake()

func onTimeout():
	set_process(false)
