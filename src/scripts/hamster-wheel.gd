extends StaticBody2D


var should_rotate := false


func rotate_normal():
	$AnimationPlayer.play("rotate")


func rotate_fast():
	$AnimationPlayer.play("rotate-fast")


func stop_rotating():
	$AnimationPlayer.stop()
