extends KinematicBody2D

const hAccel = 6
const hDecel = 10
const hMAX_SPEED = 60
const GRAVITY = 9
const JUMP_POWER = -200
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var onGround = false
var jumpCount = 2
var facing = 1


func _physics_process(delta):
	
	character_movement()
	

	
	


func character_movement():
	
	#Horizontal Move
	if Input.is_action_pressed("ui_right"):
		facing = 1
		if velocity.x < hMAX_SPEED:
			velocity.x += hAccel 
	elif Input.is_action_pressed("ui_left"):
		facing = -1
		if velocity.x > -hMAX_SPEED:
			velocity.x -= hAccel 
	else:
		if velocity.x > 0:
			velocity.x -= hDecel
		elif velocity.x < 0:
			velocity.x += hDecel
		else:
			velocity.x = 0
	
	#Jump
	if Input.is_action_pressed("ui_up"):
		if onGround == true:
			velocity.y = JUMP_POWER
			onGround == false
		elif jumpCount > 0:
			velocity.y = JUMP_POWER
			jumpCount -= 1
			print("double jump")
	
	velocity.y += GRAVITY
	
	if is_on_floor():
		onGround = true
		jumpCount = 2
	else:
		onGround = false
	
	
	velocity = move_and_slide(velocity, FLOOR)


func character_animation():
	
	
	if onGround == true && velocity.x != 0:
		$AnimatedSprite.play("IdlHorizontal")
	else:
		$AnimatedSprite.play("IdleHorizontal")
	