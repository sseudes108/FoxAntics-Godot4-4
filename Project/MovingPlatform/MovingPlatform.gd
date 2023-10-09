extends AnimatableBody2D

@export var p1: Marker2D
@export var p2: Marker2D

@export var speed: float = 50

var timeToMove: float = 0
var tween: Tween

func _ready():
	TimeToMove()

func TimeToMove():
	var delta = p1.global_position.distance_to(p2.global_position)
	timeToMove = delta / speed

func Move():
	tween = get_tree().create_tween()
	tween.set_loops(0)
	tween.tween_property(self,"global_position",p1.global_position,timeToMove)
	tween.tween_property(self,"global_position",p2.global_position,timeToMove)



















