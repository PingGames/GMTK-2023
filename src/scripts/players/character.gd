extends CharacterBody2D

const UP_DIRECTION := Vector2.UP

@export var speed := 600.0
@export var jump_strength := 1500.0
@export var maximum_number_of_jumps := 2
@export var double_jump_strength := 1200.0
@export var gravity := 4500.0

var _jumps_made := 0
var _walk_is_playing = false
var _run_is_playing = false

var is_in_hamster_cage := false


func _physics_process(delta):
	var horizontal_direction = (
		Input.get_action_strength("move_right")
		- Input.get_action_strength("move_left")
	)
	var shift_key_pressed = Input.is_action_pressed("shift")
	
	velocity.x = horizontal_direction * speed
	velocity.y += gravity * delta
	
	if shift_key_pressed:
		velocity.x *= 2.5
	
	var is_falling := velocity.y > 0.0 and not is_on_floor()
	var is_jumping := Input.is_action_just_pressed("jump") and is_on_floor()
	var is_double_jumping := Input.is_action_just_released("jump") and is_falling
	var is_jump_cancelled := Input.is_action_just_released("jump") and velocity.y > 0.0
	var is_idling := is_on_floor() and is_zero_approx(velocity.x)
	var is_running := is_on_floor() and not is_zero_approx(velocity.x) and Input.is_action_pressed("shift")
	var is_walking := is_on_floor() and not is_zero_approx(velocity.x) and not Input.is_action_pressed("shift")
	
	if is_jumping or is_double_jumping:
		_jumps_made += 1
		if _jumps_made <= maximum_number_of_jumps:
			velocity.y = -jump_strength
	elif is_jump_cancelled:
		velocity.y = 0.0
	elif is_idling or is_walking or is_running:
		_jumps_made = 0
	
	if horizontal_direction == 1:
		$Character.scale.x = 1
	elif horizontal_direction == -1:
		$Character.scale.x = -1
	
	if is_jumping or is_double_jumping:
		$Character/RigSide.show()
		$Character/RigFront.hide()
		$Character/AnimationPlayer.play("jump")
		$JumpSound.play()
		
		$WalkOnGrassSound.stop()
		$WalkOnWoodSound.stop()
		_walk_is_playing = false
		_run_is_playing = false
	elif is_idling:
		$Character/RigFront.show()
		$Character/RigSide.hide()
		$Character/AnimationPlayer.play("idle")

		$WalkOnGrassSound.stop()
		$WalkOnWoodSound.stop()
		
		_walk_is_playing = false
		_run_is_playing = false
	elif is_walking:
		$Character/RigSide.show()
		$Character/RigFront.hide()
		$Character/AnimationPlayer.play("walk")
		
		$WalkOnWoodSound.pitch_scale = 1.5
		
		if not (_run_is_playing or _walk_is_playing):
			$WalkOnWoodSound.play()
		
		_run_is_playing = false
		_walk_is_playing = true
	elif is_running:
		$Character/RigSide.show()
		$Character/RigFront.hide()
		$Character/AnimationPlayer.play("run")

		$WalkOnWoodSound.pitch_scale = 1.75
		
		if not (_run_is_playing or _walk_is_playing):
			$WalkOnWoodSound.play()
		
		_run_is_playing = true
		_walk_is_playing = false
	elif is_falling:
		$Character/RigSide.show()
		$Character/RigFront.hide()
		$Character/AnimationPlayer.play("fall")
		
		$WalkOnGrassSound.stop()
		$WalkOnWoodSound.stop()
		
		_walk_is_playing = false
		_run_is_playing = false
	
	# if is_running and is_in_hamster_cage:
	# 	print("Yes")
	# 	HamsterWheel.rotate_normal()
	# 	print("Fast")
	# if is_walking and is_in_hamster_cage:
	# 	HamsterWheel.rotate_fast()
	# else:
	# 	HamsterWheel.stop_rotating()
	# 	print("Stop")
	
	move_and_slide()


func _on_finished_trigger_body_entered(body):
	SceneTransition.change_scene_to_file("res://scenes/end.tscn", 0.5)


func _on_area_2d_body_entered(body):
	is_in_hamster_cage = true


func _on_area_2d_body_exited(body):
	is_in_hamster_cage = false
