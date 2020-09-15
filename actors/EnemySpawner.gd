extends KinematicBody2D

onready var enemy_scene = preload("res://actors/TriangleEnemy.tscn")
var spawnTime : = 2
var target_for_enemies = null

func set_target(player_scene):
	target_for_enemies = player_scene

func spawn_enemy(enemy_scene):
	if Global.triangle_enemies_amount < Global.maximun_triangle_Enemies:
		var enemy = enemy_scene.instance()
		enemy.position.x = position.x
		enemy.position.y = position.y
		enemy.set_target(target_for_enemies)
		get_parent().add_child(enemy)
		get_parent().bees.append(enemy)
		$Timer.set_wait_time(spawnTime)
		Global.triangle_enemies_amount +=1

func _on_Timer_timeout():
	spawn_enemy(enemy_scene) 

func _ready():
	pass
	

	
	
	
		
		
		
		
		


# Replace with function body.
