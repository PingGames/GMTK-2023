extends Node2D


func _ready():
	$AnimationPlayer.play("intro")
	await $AnimationPlayer.animation_finished
	SceneTransition.change_scene_to_file("res://scenes/ui/menu.tscn")
