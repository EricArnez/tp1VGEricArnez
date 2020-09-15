extends KinematicBody2D

export var move_speed = 400
var is_dead = false
var dashing = false
var max_speed = 500
var acceleration = 2000
var movement = Vector2.ZERO


func _process(delta):
	if Input.is_action_just_pressed("dash"):
		dashing = true
		$DashTimer.start()
	if was_hit():
		die()	
	pass

func _physics_process(delta):
	if dashing:
		do_dash(delta)
	if (!dashing):
		move_to_mouse(delta)
#		
func increment_rhombus_count():
	Global.rhombus_count += 1

func apply_movement(acceleration):
	movement += acceleration
	movement = movement.clamped(max_speed)

func move_to_mouse(delta):
	var direction = get_global_mouse_position() - position
	if (position.distance_to(get_global_mouse_position()) > 10):
		apply_movement(direction * acceleration * delta) 
		movement = move_and_slide(movement)

		
func do_dash(delta):
	dashing = true
	var normalized_direction = (get_global_mouse_position() - position).normalized()
	if (position.distance_to(get_global_mouse_position())> 10): 
		apply_movement(normalized_direction * acceleration * delta) 
		movement = move_and_slide(movement * 3)

func was_hit():
	if get_slide_count() > 0:
		for element in range(get_slide_count()):
			return ("Enemy" in get_slide_collision(element).collider.name)
		

func die():
	is_dead = true
	$AnimatedSprite.visible=false
	$CollisionShape2D.disabled = true
	get_parent().game_over()
	get_parent().remove_child(self)
	
	
func remove():	
	queue_free()


func _on_Timer_timeout():
	get_tree().change_scene("res://Labels/Game Over.tscn")
	pass 


func _on_DashTimer_timeout():
	dashing = false
	pass 


func _ready():
	pass
