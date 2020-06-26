extends Node2D

const units = preload("res://resources/battleUnits.tres")

export(Array, PackedScene) var enemies = []

onready var uiBase = $ui/base
onready var buttons = $ui/base/buttons
onready var nextRoomCtn = $ui/base/nextRoomContainer
onready var uiPlayer = $ui/animationPlayer
onready var startPos = $enemyPos

onready var enemy = units.enemy
onready var stats = units.player

func _ready():
	randomize()
	start_player_turn()
	if enemy != null:
		enemy.connect("died", self, "_on_enemy_died")

func enable_buttons():
	for btn in buttons.get_children():
		btn.disabled = false

func disable_buttons():
	for btn in buttons.get_children():
		btn.disabled = true

func start_enemy_turn():
	disable_buttons()
		
	if enemy != null:
		enemy.attack(stats)
		yield(enemy, "end_turn")
		
	start_player_turn()
	
func start_player_turn():
	enable_buttons()
	stats.ap = stats.max_ap
	yield(stats, "end_turn")
	start_enemy_turn()

func _on_swordBtn_pressed():
	if enemy != null:
		enemy.take_damange(4)
		stats.ap -= 1

func create_new_enemy():
	enemies.shuffle()
	var get_enemy = enemies.front()
	var enemy_instance = get_enemy.instance()
	startPos.add_child(enemy_instance)
	enable_buttons()
	
	if enemy != null:
		enemy.connect("died", self, "_on_enemy_died")
		

func _on_enemy_died():
	disable_buttons()
	nextRoomCtn.show()
	
func _on_nextRoomBtn_pressed():
	uiPlayer.play("fadeToNewRoom")
	uiBase.hide()
	yield(uiPlayer, "animation_finished")
	nextRoomCtn.hide()
	uiBase.show()
	create_new_enemy()
