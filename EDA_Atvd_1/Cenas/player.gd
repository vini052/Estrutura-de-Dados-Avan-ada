extends CharacterBody2D

signal CIMA
signal DIR

@export var inv: Inv


var speed = 200
var ver = 0
var idle_ver = 0
var horizontal = 0
var vertical = 0
var hor = 0


func _physics_process(delta):

	var hor = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if hor<0 && ver==0:
		horizontal = -1
	elif hor>0 && ver ==0:
		horizontal = 1
	else:
		horizontal = 0
	var ver = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	if ver<0 && hor==0:
		vertical = -1
	elif ver>0 && hor==0:
		vertical = 1
	else:
		vertical = 0
		
	velocity.x = horizontal*speed
	velocity.y = vertical*speed
	
	if $PlayerAnim.animation == "idle_up" or $PlayerAnim.animation == "walk_up":
		emit_signal("CIMA")
	else:
		emit_signal("DIR")
		
	animation()
	move_and_slide()
	
func animation():
	if velocity.x>0:
		$PlayerAnim.scale.x = 1
	elif velocity.x<0:
		$PlayerAnim.scale.x = -1
		
	if abs(velocity.x)>0 && abs(velocity.y)==0:
		idle_ver = 2
		$PlayerAnim.play("walk_hor")

	elif abs(velocity.x)<=0 && abs(velocity.y)==0:
		$PlayerAnim.play("idle_hor")
		
		
	if abs(velocity.y)>0 && abs(velocity.x)==0:
		if velocity.y < 0:
			$PlayerAnim.play("walk_up")
			idle_ver = 1

		else:
			$PlayerAnim.play("walk_down")
			idle_ver = 0

	elif abs(velocity.y)<=0 && abs(velocity.x)==0 && idle_ver<2:
		if idle_ver == 1:
			$PlayerAnim.play("idle_up")

		elif idle_ver == 0:
			$PlayerAnim.play("idle_down")


func collect(item):
	inv.insert(item)
