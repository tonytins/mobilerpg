extends Node2D

signal died
signal end_turn

export var hp = 29 setget set_hp

var target = null

onready var hp_label = $hpLbl
onready var player = $animationPlayer

func _ready():
	hp_label.text = str(hp) + "hp"

func attack(target):
	yield(get_tree().create_timer(0.4), "timeout")
	player.play("attack")
	self.target = target
	yield(player, "animation_finished")
#	self.target = null
	emit_signal("end_turn")

func set_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + "hp"	

func take_damange(amount):
	hp -= amount
	if is_dead():
		emit_signal("died")
		queue_free()
	else:
		player.play("shake")

func deal_damage():
	self.target.hp -= 4
		
func is_dead():
	return hp <= 0
