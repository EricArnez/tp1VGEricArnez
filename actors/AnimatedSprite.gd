extends AnimatedSprite


func remove():
	get_parent().remove_child(self)
	queue_free()

func _ready():
	pass # Replace with function body.
