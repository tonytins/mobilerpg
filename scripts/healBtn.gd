extends "res://scripts/baseBtn.gd"

func _on_pressed():
	var player = units.player
	if player != null:
		if player.mp >= 8:
			player.hp >= 5
			player.mp -= 8
			player.ap -= 1
