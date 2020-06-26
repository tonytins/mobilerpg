extends Node2D

onready var enemy = $enemy
onready var stats = $stats
onready var sword_btn = $ui/base/buttons/swordBtn
onready var health_btn = $ui/base/buttons/healBtn
onready var block_btn = $ui/base/buttons/blockBtn
onready var buttons = $ui/base/buttons

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
