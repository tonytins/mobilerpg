extends Node2D

onready var enemy = $enemy
onready var stats = $stats
onready var sword_btn = $ui/base/grid/swordBtn
onready var health_btn = $ui/base/grid/healBtn
onready var block_btn = $ui/base/grid/blockBtn

func _ready():
	start_player_turn()

func start_enemy_turn():
	
	sword_btn.disabled = true
	health_btn.disabled = true
	block_btn.disabled = true
	
	if enemy != null:
		enemy.attack(stats)
		yield(enemy, "end_turn")
		
	start_player_turn()
	
func start_player_turn():
	
	sword_btn.disabled = false
	health_btn.disabled = false
	block_btn.disabled = false
	
	stats.ap = stats.max_ap
	yield(stats, "end_turn")
	start_enemy_turn()

func _on_swordBtn_pressed():
	if enemy != null:
		enemy.take_damange(4)
		stats.ap -= 1

func _on_enemy_died():
	sword_btn.disabled = true
	health_btn.disabled = true
	block_btn.disabled = true
	enemy = null
