extends CanvasLayer


var is_playing := false


func play():
	if is_playing:
		return
	
	is_playing = true
	$AudioStreamPlayer.play()


func stop():
	if not is_playing:
		return
	
	is_playing = false
	$AudioStreamPlayer.stop()


func play_quieter():
	$AudioStreamPlayer.volume_db -= 12
	play()


func play_normal():
	$AudioStreamPlayer.volume_db = 0
	play()
