extends KinematicBody2D

var speed: = Vector2(200.0, 700.0)
var _velocity = Vector2(0, 0)
var gravity = 2000

const FLOOR_NORMAL: = Vector2.UP

func _physics_process(delta: float) -> void:
	
	_velocity.y += gravity * delta
	#var direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	if (Input.is_action_just_pressed("jump") and is_on_floor()):
		_velocity.y = -speed.y
	if (Input.is_action_pressed("move_right")):
		$AnimatedSprite.play()
		_velocity.x = speed.x
		$AnimatedSprite.flip_h = false
	elif (Input.is_action_pressed("move_left")):
		$AnimatedSprite.play()
		$AnimatedSprite.flip_h = _velocity.x < 0
		_velocity.x = -speed.x
	else:
		_velocity.x = 0
		$AnimatedSprite.frame = 10
		$AnimatedSprite.stop()
		
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
	#move_and_slide(_velocity, FLOOR_NORMAL)
	
