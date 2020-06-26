extends "res://scripts/baseBtn.gd"

const slash = preload("res://scenes/slash.tscn")

func _on_pressed():
	var enemy = units.enemy
	var stats = units.player
	if enemy != null and stats != null:
		create_slash(enemy.global_position)
		enemy.take_damange(4)
		stats.mp += 2
		stats.ap -= 1

func create_slash(pos):
	var new_slash = slash.instance()
	var main = get_tree().current_scene
	main.add_child(new_slash)
	new_slash.global_position = pos
