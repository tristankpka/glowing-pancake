extends KinematicBody2D

export (int) var speed = 250

var target = Vector2()
var velocity = Vector2()

func _input(event):
    if event.is_action_pressed('click'):
        target = get_global_mouse_position()

func _process(delta):
	if velocity.length() > 0:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x < 0:
				$AnimatedSprite.animation = "left"
			else:
				$AnimatedSprite.animation = "right"
		else:
			if velocity.y < 0:
				$AnimatedSprite.animation = "up"
			else:
				$AnimatedSprite.animation = "down"
		if(not $AnimatedSprite.is_playing()):
			$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()

func _physics_process(delta):
	velocity = (target - position).normalized() * speed
	print(velocity)
	#rotation = velocity.angle()
	if (target - position).length() > 5:
	    move_and_slide(velocity)
	else:
		position = target