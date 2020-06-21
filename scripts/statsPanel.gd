extends Panel

onready var hp_label = $statsCtr/hpLbl
onready var mp_label = $statsCtr/mpLbl
onready var ap_label = $statsCtr/apLbl

func _on_stats_ap_changed(val):
	ap_label.text = "ap\n"+str(val)

func _on_stats_hp_changed(val):
	hp_label.text = "hp\n"+str(val)

func _on_stats_mp_changed(val):
	mp_label.text = "mp\n"+str(val)
