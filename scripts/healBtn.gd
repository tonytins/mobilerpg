extends "res://scripts/baseBtn.gd"

func _on_pressed():
	var main = get_tree().current_scene
	var stats = main.find_node("stats")
	if stats != null:
		if stats.mp >= 8:
			stats.hp >= 5
			stats.mp -= 8
			stats.ap -= 1
