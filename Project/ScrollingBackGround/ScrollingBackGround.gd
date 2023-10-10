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
@export var spriteOffset: Vector2 = Vector2(0,-500)
@export var spriteScale: Vector2 = Vector2(0.72,0.72)

func _ready():
	AddBackground()

func IncrementSpeed() -> float:
	return 1.0 / BG_FILES[level].size()

func GetSprite(texture: Texture2D) -> Sprite2D:
	var sprite = Sprite2D.new()
	sprite.texture = texture
	sprite.scale = spriteScale
	sprite.offset = spriteOffset
	return sprite

func AddLayer(texture: Texture2D, timeOffset: float):
	var sprite = GetSprite(texture)
	
	var paraLayer = ParallaxLayer.new()
	paraLayer.motion_mirroring = Vector2(mirrorX,0)
	paraLayer.motion_scale = Vector2(timeOffset,1)
	paraLayer.add_child(sprite)
	
	add_child(paraLayer)

func AddBackground():
	var increment = IncrementSpeed()
	var timeOffset = increment
	var fileList = BG_FILES[level]
	
	for index in range(fileList.size()):
		var backgFile = fileList[index]
		if index == 0:
			AddLayer(backgFile,1)
		else:
			timeOffset += increment
			AddLayer(backgFile,timeOffset)









	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
