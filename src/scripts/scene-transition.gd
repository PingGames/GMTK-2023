extends CanvasLayer


func change_scene_to_file(target: String, delay: float = 1.0) -> void:
	$AnimationPlayer.play("dissolve")
	
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	await get_tree().create_timer(delay).timeout
	
	$AnimationPlayer.play_backwards("dissolve")


func quit_game() -> void:
	$AnimationPlayer.play("dissolve")
	
	await $AnimationPlayer.animation_finished
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
