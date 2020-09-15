extends Node2D

var game_over_scene = load("res://Labels/Game Over.tscn")
var player = load("res://actors/Player.tscn")
var bees: Array = []
var hives: Array = []

func game_over():
	var t = Timer.new()	
	t.set_wait_time(1)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	get_tree().change_scene("res://Labels/Game Over.tscn")

func create_player():
	var screen_size = get_viewport().get_visible_rect().size
	var new_player = player.instance()
	new_player.position.x = screen_size.x / 2
	new_player.position.y = screen_size.y / 2
	add_child(new_player)

func _ready():
	var screen_size = get_viewport().get_visible_rect().size
	Global.triangle_enemies_amount =0
	Global.rhombus_count = 0
	Global.rhombus_amount = 0
	spawn_rhombus()
	create_enemy_spawners()
	$Player.position.x = screen_size.x / 2
	$Player.position.y = screen_size.y / 2
	

func spawn_rhombus():
	var screen_size = get_viewport().get_visible_rect().size
	for n in range(Global.maximum_rhombus):
		var rhombus =	preload("res://actors/Rombito.tscn")
		var new_rhombus = rhombus.instance()
		new_rhombus.position.x = rand_range(1, screen_size.x)
		new_rhombus.position.y = rand_range(1, screen_size.y)
		add_child(new_rhombus)
		Global.rhombus_amount += 1 

func create_enemy_spawners():
	var screen_size = get_viewport().get_visible_rect().size
	for n in range(Global.maximun_enemy_spawners):
		var enemy_spawner =	preload("res://actors/EnemySpawner.tscn")
		var new_enemy_spawner = enemy_spawner.instance()
		new_enemy_spawner.set_target($Player)
		new_enemy_spawner.position.x = rand_range(1, screen_size.x)
		new_enemy_spawner.position.y = rand_range(1, screen_size.y)
		add_child(new_enemy_spawner)
		Global.enemy_spawner_amount += 1 


func _on_RhombusTimer_timeout():
	spawn_rhombus()
	pass # Replace with function body.
