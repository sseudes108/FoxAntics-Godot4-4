extends Node

signal EnemyHit(points: int, position: Vector2)
signal PickedUp(points: int)
signal BossKilled(points: int)
signal PlayerHit(health: int)
signal LevelComplete()
signal GameOver()
signal UpdateScore(score: int)
