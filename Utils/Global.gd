extends Node

var rhombus_count = 0
var triangle_enemies_amount = 0
var enemy_spawner_amount = 0
var rhombus_amount = 0
var maximun_triangle_Enemies = 4
var maximun_enemy_spawners = 3
var maximum_rhombus = 3
	


func start_level():
	get_tree().change_scene("res://Basic_World.tscn")
