extends "res://scripts/baseBtn.gd"

func _on_pressed():
	var main = get_tree().current_scene
	var enemy = main.find_node("enemy")
	var stats = main.find_node("stats")
	if enemy != null and stats != null:
		enemy.take_damange(4)
		stats.mp += 2
		stats.ap -= 1
