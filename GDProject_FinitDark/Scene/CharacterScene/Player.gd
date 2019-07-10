extends KinematicBody2D

const WALK_SPEED = 100
const SPRINT_SPEED = 120
const AIR_SPEED = 80

const hAccel = 0.1
const hDecel = 0.2

const GRAVITY = 7
const JUMP_POWER = -200
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var hMOVE_SPEED = null

var onGround = false
var jumpCount = 2
var facing = 1


func _physics_process(delta):
	
	character_movement()
	
	character_animation()
	


func character_movement():
	
	if onGround == true:
		hMOVE_SPEED = WALK_SPEED
	elif onGround == false:
		hMOVE_SPEED = AIR_SPEED
	
	#Horizontal Move
	if Input.is_action_pressed("ui_right"):
		velocity.x = lerp(velocity.x, hMOVE_SPEED, hAccel)
		if onGround == true:
			facing = 1
	elif Input.is_action_pressed("ui_left"):
		velocity.x = lerp(velocity.x, -hMOVE_SPEED, hAccel)
		if onGround == true:
			facing = -1
	else:
		velocity.x = lerp(velocity.x, 0, hDecel)
		if facing > 0 && velocity.x <= 0.5:
			velocity.x = 0
		elif facing < 0 && velocity.x >= -0.5:
			velocity.x = 0
	
	#Jump
	if Input.is_action_pressed("ui_A"):
		if onGround == true:
			velocity.y = JUMP_POWER
			onGround == false
	
	velocity.y += GRAVITY
	
	if is_on_floor():
		onGround = true
		jumpCount = 2
	else:
		onGround = false
	
	
	
	velocity = move_and_slide(velocity, FLOOR)


func character_animation():
	
	
	if onGround == true && facing < 0:
		$AnimatedSprite.flip_h = true
		if facing > 0:
			$AnimatedSprite.play("Turn")
	elif onGround == true && facing > 0:
		$AnimatedSprite.flip_h = false
		if facing < 0:
			$AnimatedSprite.play("Turn")
	
	
	if onGround == true && Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("MoveHorizontal")
	elif onGround == true:
		$AnimatedSprite.play("IdleHorizontal")
	
	
	if onGround == false:
		if Input.is_action_pressed("ui_A"):
			$AnimatedSprite.play("JumpStart")
			if velocity.y > 0:
				$AnimatedSprite.play("JumpEnd")
		elif velocity.y <= 0:
			$AnimatedSprite.play("Falling")
		