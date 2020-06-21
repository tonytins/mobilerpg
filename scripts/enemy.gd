extends Node2D

export var hp = 29 setget set_hp

onready var hp_label = $hpLbl

func _ready():
	hp_label.text = str(hp) + "hp"

func set_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + "hp"
