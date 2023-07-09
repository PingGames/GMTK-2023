extends Node2D


func _ready():
	await get_tree().create_timer(0.5).timeout
	Music.play()


func _on_play_again_button_pressed():
	SceneTransition.change_scene_to_file("res://scenes/level.tscn", 1.0)
	Music.stop()


func _on_menu_button_pressed():
	SceneTransition.change_scene_to_file("res://scenes/ui/menu.tscn")
