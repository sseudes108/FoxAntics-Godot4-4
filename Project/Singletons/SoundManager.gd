extends Node

const LASER = "laser"
const CHECKPOINT = "checkpoint"
const DAMAGE = "damage"
const KILL = "kill"
const GAMEOVER = "gameover1"
const IMPACT = "impact"
const LAND = "land"
const MUSIC1 = "music1"
const MUSIC2 = "music2"
const PICKUP = "pickup"
const BOSS_ARRIVE = "boss_arrive"
const BOSS_HIT = "boss_hit"
const JUMP = "jump"
const WIN = "win"
const ENEMY_EXPLODE = "enemy_explode"

var SOUNDS = {
	CHECKPOINT: preload("res://assets/sound/checkpoint.wav"),
	DAMAGE: preload("res://assets/sound/Player Hurt.wav"),
	KILL: preload("res://assets/sound/pickup5.ogg"),
	GAMEOVER: preload("res://assets/sound/game_over.ogg"),
	IMPACT: preload("res://assets/sound/impact.wav"),
	JUMP: preload("res://assets/sound/jump.wav"),
	LAND: preload("res://assets/sound/land.wav"),
	LASER: preload("res://assets/sound/laser.wav"),
	MUSIC1: preload("res://assets/sound/Farm Frolics.ogg"),
	MUSIC2: preload("res://assets/sound/Flowing Rocks.ogg"),
	PICKUP: preload("res://assets/sound/Pickup Health.wav"),
	BOSS_ARRIVE: preload("res://assets/sound/boss_arrive.wav"),
	BOSS_HIT: preload("res://assets/sound/Boss Hit.wav"),
	WIN: preload("res://assets/sound/Warp Jingle.wav"),
	ENEMY_EXPLODE: preload("res://assets/sound/EnemyExplode.wav")
}

func PlaySound(player: AudioStreamPlayer2D, sound: String):
	if SOUNDS.has(sound) == false:
		return
	player.stream = SOUNDS[sound]
	player.play()
