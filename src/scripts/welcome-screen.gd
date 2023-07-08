extends Node2D


func _on_start_button_pressed():
	SceneTransition.change_scene_to_file("res://scenes/level.tscn", 1.0)


func _on_quit_button_pressed():
	SceneTransition.quit_game()


func _on_credits_button_pressed():
	# TODO: Add this scene
	pass
