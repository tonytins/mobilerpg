extends Node

signal hp_changed(val)
signal ap_changed(val)
signal mp_changed(val)

export var max_hp = 25
export var max_ap = 3
export var max_mp = 10

var hp = max_hp setget set_hp
var ap = max_ap setget set_ap
var mp = max_mp setget set_mp

func set_hp(val):
	hp = min(val, max_hp)
	emit_signal("hp_changed", hp)

func set_ap(val):
	ap = min(val, max_ap)
	emit_signal("ap_changed", ap)
	
func set_mp(val):
	mp = min(val, max_mp)
	emit_signal("mp_changed", mp)
