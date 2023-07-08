extends Node2D


func _on_play_again_button_pressed():
	SceneTransition.change_scene_to_file("res://scenes/level.tscn", 1.0)


func _on_menu_button_pressed():
	SceneTransition.change_scene_to_file("res://scenes/menu.tscn")
