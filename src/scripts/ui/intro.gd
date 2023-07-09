extends Node2D


func _ready():
	await get_tree().create_timer(0.5).timeout
	Music.play_normal()
	$AnimationPlayer.play("intro")
	await $AnimationPlayer.animation_finished
	SceneTransition.change_scene_to_file("res://scenes/ui/menu.tscn")
