extends Node2D

signal died

export var hp = 29 setget set_hp

onready var hp_label = $hpLbl
onready var player = $animationPlayer

func _ready():
	hp_label.text = str(hp) + "hp"

func set_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + "hp"
	
	if hp <= 0:
		emit_signal("died")
		queue_free()
	else:
		player.play("shake")
		yield(player, "animation_finished")
		player.play("attack")
		yield(player, "animation_finished")
		var battle = get_tree().current_scene
		var player = battle.find_node("stats")
		player.hp -= 3
		
		
