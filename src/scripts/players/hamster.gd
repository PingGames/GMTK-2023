extends Node2D


func _on_enable_body_entered(body):
	$YouGotCaughtTrigger.monitoring = true
	$AnimationPlayer.play("walk")
	await $AnimationPlayer.animation_finished
	$YouGotCaughtTrigger.monitoring = false


func _on_trigger_body_entered(body):
	SceneTransition.change_scene_to_file("res://scenes/ui/you-got-caught.tscn")
