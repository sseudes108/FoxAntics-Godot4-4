extends ParallaxBackground

var BG_FILES = {
	1: [
		preload("res://assets/backgrounds/game_background_1/layers/sky.png"),
		preload("res://assets/backgrounds/game_background_1/layers/clouds_1.png"),
		preload("res://assets/backgrounds/game_background_1/layers/clouds_2.png"),
		preload("res://assets/backgrounds/game_background_1/layers/clouds_3.png"),
		preload("res://assets/backgrounds/game_background_1/layers/clouds_4.png"),
		preload("res://assets/backgrounds/game_background_1/layers/rocks_1.png"),
		preload("res://assets/backgrounds/game_background_1/layers/rocks_2.png")
	],
	2: [
		preload("res://assets/backgrounds/game_background_2/layers/sky.png"),
		preload("res://assets/backgrounds/game_background_2/layers/birds.png"),
		preload("res://assets/backgrounds/game_background_2/layers/clouds_1.png"),
		preload("res://assets/backgrounds/game_background_2/layers/clouds_2.png"),
		preload("res://assets/backgrounds/game_background_2/layers/clouds_3.png"),
		preload("res://assets/backgrounds/game_background_2/layers/pines.png"),
		preload("res://assets/backgrounds/game_background_2/layers/rocks_1.png"),
		preload("res://assets/backgrounds/game_background_2/layers/rocks_2.png"),
		preload("res://assets/backgrounds/game_background_2/layers/rocks_3.png")
	],
	3: [
		preload("res://assets/backgrounds/game_background_3/layers/sky.png"),
		preload("res://assets/backgrounds/game_background_3/layers/clouds_1.png"),
		preload("res://assets/backgrounds/game_background_3/layers/clouds_2.png"),
		preload("res://assets/backgrounds/game_background_3/layers/ground_1.png"),
		preload("res://assets/backgrounds/game_background_3/layers/ground_2.png"),
		preload("res://assets/backgrounds/game_background_3/layers/ground_3.png"),
		preload("res://assets/backgrounds/game_background_3/layers/plant.png"),
		preload("res://assets/backgrounds/game_background_3/layers/rocks.png")
	],
	4: [
		preload("res://assets/backgrounds/game_background_4/layers/sky.png"),
		preload("res://assets/backgrounds/game_background_4/layers/clouds_1.png"),
		preload("res://assets/backgrounds/game_background_4/layers/clouds_2.png"),
		preload("res://assets/backgrounds/game_background_4/layers/ground.png"),
		preload("res://assets/backgrounds/game_background_4/layers/rocks.png")
	]
}

@export_range(1,4) var level: int
@export var mirrorX: float = 1382.4
@export var spriteOffset: Vector2 = Vector2(0,-300)
@export var spriteScale: Vector2 = Vector2(0.72,0.72)

func _ready():
	pass
