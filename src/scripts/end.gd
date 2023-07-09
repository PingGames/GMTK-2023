extends Node2D


func _on_yippee_trigger_body_entered(body):
	SceneTransition.change_scene_to_file("res://scenes/ui/yippee.tscn")
