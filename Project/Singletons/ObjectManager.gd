extends Node

enum SHOOTER { PLAYER, ENEMY }

const BULLETS = {
	SHOOTER.PLAYER: preload("res://Project/Bullet/PlayerBullet/PlayerBullet.tscn"),
	SHOOTER.ENEMY: preload("res://Project/Bullet/EnemyBullet/EnemyBullet.tscn")
}

#Scenes
const Explosion = preload("res://Project/Explosion/Explosion.tscn")
const pickUp = preload("res://Project/PickUp/PickUp.tscn")

func AddDefered(child):
	get_tree().root.add_child(child)

func AddChild(child):
	call_deferred("AddDefered", child)

	###### Shooter, Direction, Speed, Firepoint
func Shot(shooter:SHOOTER, dir: Vector2, speed: float, startPos: Vector2):
	var newBullet = BULLETS[shooter].instantiate()
	newBullet.SetUp(dir, speed)
	newBullet.global_position = startPos
	AddChild(newBullet)

# Explosions
func EnemyExplosion(position: Vector2):
	var EnemyExplosion = Explosion.instantiate()
	EnemyExplosion.global_position = position
	AddChild(EnemyExplosion)

func PlayerExplosion(position: Vector2):
	var playerExplosion = Explosion.instantiate()
	playerExplosion.global_position = position
	AddChild(playerExplosion)

# PickUp
func PickUp(position: Vector2):
	var newPickUp = pickUp.instantiate()
	newPickUp.global_position = position
	AddChild(newPickUp)


	
	
	
	
	
	
	
	
