extends Node2D

const units = preload("res://resources/battleUnits.tres")

onready var buttons = $ui/base/buttons

onready var enemy = units.enemy
onready var stats = units.player

func _ready():
	start_player_turn()

func start_enemy_turn():
	for btn in buttons.get_children():
		btn.disabled = true
	if enemy != null:
		enemy.attack(stats)
		yield(enemy, "end_turn")
		
	start_player_turn()
	
func start_player_turn():
	for btn in buttons.get_children():
		btn.disabled = false
	
	stats.ap = stats.max_ap
	yield(stats, "end_turn")
	start_enemy_turn()

func _on_swordBtn_pressed():
	if enemy != null:
		enemy.take_damange(4)
		stats.ap -= 1

func _on_enemy_died():
	for btn in buttons.get_children():
		btn.disabled = true
		
	enemy = null
