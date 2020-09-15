extends Area2D

func _process(delta):
	if was_touched_by_player():
		for element in (get_overlapping_bodies()):
			if ("Player" in element.name):
				element.increment_rhombus_count()
		remove()
	
		
func was_touched_by_enemy():
	for element in (get_overlapping_bodies()):
			return ("Enemy" in element.name)

func was_touched_by_player():
	for element in (get_overlapping_bodies()):
			return ("Player" in element.name)

func _ready():
	pass

func remove():
	get_parent().remove_child(self)
	queue_free()
