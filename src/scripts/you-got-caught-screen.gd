extends Node2D


func _on_retry_button_pressed():
	SceneTransition.change_scene_to_file("res://scenes/level.tscn")


func _on_menu_button_pressed():
	SceneTransition.change_scene_to_file("res://scenes/welcome-screen.tscn")