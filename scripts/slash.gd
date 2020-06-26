extends Node2D

func _on_play_animation_finished(anim_name):
	queue_free()
