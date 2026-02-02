extends CharacterBody2D


const speed = 100
var current_dir = "none"

func _ready():
	$AnimatedSprite2D.play("front_idle")


func _physics_process(delta: float) -> void:
	player_movement(delta)
	
func player_movement(_delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_animation(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_animation(1)
		velocity.x = 0
		velocity.y = speed	
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_animation(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()

func play_animation(movement):
	var dir = current_dir
	var animation = $AnimatedSprite2D
	
	if dir == "right":
		animation.flip_h = false
		if movement == 1:
			animation.play("right_walk")
		elif movement == 0:
			animation.play("right_idle")
	elif dir == "left":
		animation.flip_h = false
		if movement == 1:
			animation.play("left_walk")
		elif movement == 0:
			animation.play("left_idle")
	elif dir == "down":
		animation.flip_h = false
		if movement == 1:
			animation.play("walk_forward")
		elif movement == 0:
			animation.play("front_idle")
	elif dir == "up":
		animation.flip_h = false
		if movement == 1:
			animation.play("walk_back")
		elif movement == 0:
			animation.play("back_idle")
			
