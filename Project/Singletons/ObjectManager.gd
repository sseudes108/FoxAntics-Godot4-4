extends Node

enum SHOOTER { PLAYER, ENEMY }

const BULLETS = {
	SHOOTER.PLAYER: preload("res://Project/Bullet/PlayerBullet/PlayerBullet.tscn"),
	SHOOTER.ENEMY: preload("res://Project/Bullet/EnemyBullet/EnemyBullet.tscn")
}

func AddDefered(child):
	get_tree().root.add_child(child)

func AddChild(child):
	call_deferred("AddDefered", child)

func Shot(shooter:SHOOTER, dir: Vector2, speed: float, startPos: Vector2):
	var newBullet = BULLETS[shooter].instantiate()
	newBullet.SetUp(dir, speed)
	newBullet.global_position = startPos
	AddChild(newBullet)
