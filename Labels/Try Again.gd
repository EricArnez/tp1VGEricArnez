extends Button

func _ready():
	self.hide()
	pass 

func _on_Timer_timeout():
	self.show()
	pass
