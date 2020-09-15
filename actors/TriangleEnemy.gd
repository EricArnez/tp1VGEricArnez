extends KinematicBody2D
var player:KinematicBody2D = null
var move = Vector2.ZERO
var speed = 200
export var steer_force = 50.0

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var target = null


func set_target(player_scene):
	player = player_scene 

func _ready():
	pass # Replace with function body.

func remove():
	Global.triangle_enemies_amount -= 1
	get_parent().remove_child(self)
	queue_free()


func _on_Timer_timeout():
	remove()

func start(_transform, _target):
	global_transform = _transform
	rotation += rand_range(-0.09, 0.09)
	velocity = transform.x * speed
	player = _target

func seek():
	var steer = Vector2.ZERO
	if player:
		var desired = (player.position - position).normalized() * speed
		steer = (desired - velocity).normalized() * steer_force
	return steer

func _physics_process(delta):
	acceleration += seek()
	velocity += acceleration * delta
	velocity = velocity.clamped(speed)
	if player != null:
		position += velocity * delta
	if hitted_player():
		player.visible=false
		get_parent().game_over()	
			

func hitted_player():
	return player.position.distance_to(position)< 50
	
