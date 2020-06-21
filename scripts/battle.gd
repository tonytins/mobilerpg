extends Node2D

onready var enemy = $enemy
onready var sword = $ui/base/swordBtn

func _on_swordBtn_pressed():
	if enemy != null:
		enemy.hp -= 4

func _on_enemy_died():
	sword.disabled = true
