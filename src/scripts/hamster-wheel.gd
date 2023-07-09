extends StaticBody2D


var should_rotate := false


func rotate_normal():
	$RotatingAnimations.play("rotate")


func rotate_fast():
	$RotatingAnimations.play("rotate-fast")


func stop_rotating():
	$RotatingAnimations.stop()
