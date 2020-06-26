extends Node2D

const units = preload("res://resources/battleUnits.tres")

signal died
signal end_turn

export var hp: int = 29 setget set_hp
export var damage: int = 3

onready var hp_label = $hpLbl
onready var player = $animationPlayer


func _ready():
	units.enemy = self
	hp_label.text = str(hp) + "hp"
	
func _exit_tree():
	units.enemy = null

func attack(target):
	yield(get_tree().create_timer(0.4), "timeout")
	player.play("attack")
	units.player.hp = target
	yield(player, "animation_finished")
	emit_signal("end_turn")

func set_hp(new_hp):
	hp = new_hp
	if hp_label != null:
		hp_label.text = str(hp) + "hp"	

func take_damange(amount):
	units.enemy.hp -= amount
	if is_dead():
		emit_signal("died")
		queue_free()
	else:
		player.play("shake")

func deal_damage():
	units.player.hp -= damage
		
func is_dead():
	return hp <= 0
