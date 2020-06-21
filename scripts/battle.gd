extends Node2D

onready var enemy = $enemy

func _on_swordBtn_pressed():
	enemy.hp -= 4
