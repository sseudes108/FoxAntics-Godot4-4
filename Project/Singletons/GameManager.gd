extends Node

const GROUP_PLAYER: String = "Player"

const TOTAL_LEVELS: int = 3
const MAIN_SCENE: PackedScene = preload("res://Project/MainScene/MainScene.tscn")

var currentLevel: int = 0
var levelScenes = {}

var score: int

func _ready():
	InitLevelScenes()
	SignalManager.EnemyHit.connect(Score)

func InitLevelScenes():
	for level in range(1, TOTAL_LEVELS + 1):
		levelScenes[level] = load("res://Project/Levels/Level%s.tscn" % level)

func LoadMainScene():
	currentLevel = 0
	get_tree().change_scene_to_packed(MAIN_SCENE)

func SetNextLevel():
	currentLevel += 1
	if currentLevel > TOTAL_LEVELS:
		currentLevel = 1

func LoadNextLevel():
	SetNextLevel()
	get_tree().change_scene_to_packed(levelScenes[currentLevel])

func Score(points, _position):
	score += points
	SignalManager.UpdateScore.emit(score)
