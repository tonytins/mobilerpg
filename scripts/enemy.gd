extends Node2D

signal died
signal end_turn

export var hp = 29 setget set_hp

onready var hp_label = $hpLbl
onready var player = $animationPlayer

func _ready():
	hp_label.text = str(hp) + "hp"

func attack(target):
	yield(get_tree().create_timer(0.4), "timeout")
	player.play("attack")
	yield(player, "animation_finished")
	target.hp -= 4
	emit_signal("end_turn")

func set_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + "hp"
	
	if hp <= 0:
		emit_signal("died")
		queue_free()
		
