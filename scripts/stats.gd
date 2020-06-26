extends Node

const units = preload("res://resources/battleUnits.tres")

signal end_turn
signal hp_changed(val)
signal ap_changed(val)
signal mp_changed(val)

export var max_hp = 25
export var max_ap = 3
export var max_mp = 10

var hp = max_hp setget set_hp
var ap = max_ap setget set_ap
var mp = max_mp setget set_mp

func _ready():
	units.player = self
	
func _exit_tree():
	units.player = null

func set_hp(val: float):
	hp = clamp(val, 0, max_hp)
	emit_signal("hp_changed", hp)

func set_ap(val: float):
	ap = clamp(val, 0, max_ap)
	emit_signal("ap_changed", ap)
	
	if ap == 0:
		emit_signal("end_turn")
	
func set_mp(val: float):
	mp = clamp(val, 0, max_mp)
	emit_signal("mp_changed", mp)
